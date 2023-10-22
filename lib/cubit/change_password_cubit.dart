import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  void changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    
    emit(ChangePasswordInProgress());

    try {
      final response = await http.post(
        Uri.parse(''),
        body: {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        }
      );

      if(response.statusCode == 200) {
        emit(ChangePasswordSuccess());
      } else {
        emit(ChangePasswordFailure());
      }

    } catch(e) {
      emit(ChangePasswordFailure());
    }
  }
}
