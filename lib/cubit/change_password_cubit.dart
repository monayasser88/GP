import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gp_project/cache/cache_helper.dart';
import 'package:gp_project/core/api/api_consumer.dart';
import 'package:gp_project/core/api/end_ponits.dart';
import 'package:gp_project/core/errors/exceptions.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.api) : super(ChangePasswordInitial());
  final ApiConsumer api;
  Future<void> changePassword(String oldPassword, String newPassword) async {
    emit(ChangePasswordLoading());

    try {
      final response = await http.post(
        Uri.parse(''),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'userId': oldPassword, 'newPassword': newPassword}),
      );

      if (response.statusCode == 200) {
        emit(ChangePasswordSuccess());
      } else {
        emit(ChangePasswordFailure('Failed to change password'));
      }
    } catch (error) {
      emit(ChangePasswordFailure('Failed to change password'));
    }
  }

  Future<String> changeUserPassword(Dio dio, String currentPassword,
      String newPassword, String reNewPassword) async {
    emit(ChangePasswordLoading());
    if (newPassword != reNewPassword) {
      throw 'New password and confirm new password do not match.';
    }
    final token = CacheHelper().getData(key: ApiKey.token);

    if (token == null) {
      emit(ChangePasswordFailure('User ID not found in cache.'));
    }
    try {
      final response =
          await dio.patch(EndPoint.getChangePasswordEndPoint, data: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'reNewPassword': reNewPassword,
      },
      options: Options(headers: {'token' : token}));
      if (response.statusCode == 200) {
        emit(ChangePasswordSuccess());
      }
      return 'password changed successfully';
    } catch (e) {
      if (e is ServerException) {
        emit(ChangePasswordFailure(e.errModel.errorMessage));
      } else {
        emit(ChangePasswordFailure(
            'An error occurred while changing the password.'));
      }
      throw 'An error occurred while changing the password.';
    }
  }
}
