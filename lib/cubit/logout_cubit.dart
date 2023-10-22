import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutInProgress());

    try {
      final response = await http.post(
        Uri.parse(''),
      );

      if (response.statusCode == 200) {
        emit(LoggedOut());
      } else {
        emit(LogoutFailure());
      }
    } catch (e) {
      emit(LogoutFailure());
    }
  }
}
