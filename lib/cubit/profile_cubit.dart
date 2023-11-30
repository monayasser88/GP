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

  Future<Profile> updateFirstName(String firstName) async {

      var updatedFirstNameResponse = await http.put(Uri.parse(''),
        body: {'firstName': firstName});

      final updatedFirstNameData = json.decode(updatedFirstNameResponse.body);
    final updatedUserProfile = Profile.fromJson(updatedFirstNameData);
    return updatedUserProfile;
  }

  Future<Profile> updateLastName(String lastName) async {

    final updatedLastNameResponse = await http.put(
      Uri.parse(''),
      body: {'last_name': lastName},
    );
    final updatedLastNameData = json.decode(updatedLastNameResponse.body);
    final updatedUserProfile = Profile.fromJson(updatedLastNameData);
    return updatedUserProfile;
  }

  Future<Profile> updateCity(String city) async {

      final updatedCityResponse = await http.put(
      Uri.parse(''),
      body: {'city': city},
    );
    final updatedCityData = json.decode(updatedCityResponse.body);
    final updatedUserProfile = Profile.fromJson(updatedCityData);
    return updatedUserProfile;
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
