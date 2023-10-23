import 'dart:convert';
import 'package:gp_project/models/user_model';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  fetchProfile() async {
    emit(ProfileLoading());

    try {
      final response = await http.get(Uri.parse(''));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final profile = Profile.fromJson(jsonData);

        emit(ProfileLoaded(profile));
      } else {
        emit(ProfileError('Failed to fetch profile'));
      }
    } catch (error) {
      emit(ProfileError('An error occurred'));
    }
  }
}
