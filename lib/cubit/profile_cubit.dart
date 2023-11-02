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

  Future<void> updateFirstName(String firstName) async {

     // API call here
      var response = await http.put(Uri.parse(''),
        body: {'firstName': firstName});

      emit(UserProfileUpdated());
  }

  Future<void> updateLastName(String lastName) async {

      var response = await http.put(Uri.parse(''),
        body: {'lastName': lastName});

      emit(UserProfileUpdated());
  }

  Future<void> updateCity(String city) async {

      var response = await http.put(Uri.parse(''),
        body: {'city': city});

      emit(UserProfileUpdated());
  }

  // Future<void> updatePhoto(File photo) async {

  //    var formData = FormData({
  //      'photo': await http.MultipartFile.fromPath('photo', photo.path)
  //    });
  //    var response = await http.put(Uri.parse(''),
  //        body: formData);

  //    emit(UserProfileUpdated());
  // }

}
