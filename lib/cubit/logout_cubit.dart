import 'package:bloc/bloc.dart';
import 'package:gp_project/cache/cache_helper.dart';
import 'package:gp_project/core/api/api_consumer.dart';
import 'package:gp_project/core/api/dio_consumer.dart';
import 'package:gp_project/core/api/end_ponits.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.api) : super(LogoutInitial());
  final ApiConsumer api;
  Future<void> logout() async {
    emit(LogoutInProgress());
    try {
      final response = await http.post(
        Uri.parse(''),
      );
      //print('hi');

      if (response.statusCode == 200) {
        emit(LoggedOut());
      } else {
        emit(LogoutFailure('error in statusCode'));
      }
    } catch (e) {
      emit(LogoutFailure('can not log out'));
    }
  }

  Future<void> logout2(DioConsumer dioConsumer) async {
    emit(LogoutInProgress());

    final token = CacheHelper().getDataString(key: ApiKey.token);

    if (token == null) {
      return;
    }
    try {
      dioConsumer.dio.options.headers['token'] = token;
      final response = await dioConsumer.dio.patch(EndPoint.logoutEndpoint);

      if (response.statusCode == 200) {
        emit(LoggedOut());
        print('Logout successful');
        await CacheHelper().removeData(key: 'token');
      } else {
        emit(LogoutFailure('error in statusCode'));
      }
    } catch (e) {
      emit(LogoutFailure('can not log out'));
    }
  }
}
