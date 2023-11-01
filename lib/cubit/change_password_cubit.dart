import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  Future<void> changePassword(String oldPassword, String newPassword) async {
    emit(ChangePasswordInProgress());

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
}
