import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/core/errors/exceptions.dart';
import 'package:gp_project/models/user_model';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());



  XFile? profilePic;
  updateProfilePic(XFile image) {
    profilePic = image;
    emit(UploadPicture());
  }

  Future getUserProfile(Dio dio) async {
    try {
      emit(ProfileLoading());

      final response = await dio.get(
        'https://kemet-gp2024.onrender.com/api/v1/auth/profile',
        options: Options(headers: {
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzIyNjQ3MX0.xdh7vU90JVafhJzzXua0o4X6532iC8vxYcpMSfEbQUU'
        }),
      );

      final profile = Profile.fromJson(response.data);
      emit(ProfileLoaded(profile));
    } on ServerException catch (e) {
      emit(ProfileError('Failed to fetch user profile'));
    }
  }

 Future updateFirstName(String firstName, Dio dio,TextEditingController firstNameController) async {
  try {
    var updatedFirstNameResponse = await dio.put(
      'https://kemet-gp2024.onrender.com/api/v1/auth/updateProfile',
      data: {'firstName': firstName},
      options: Options(headers: {
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzIyNjQ3MX0.xdh7vU90JVafhJzzXua0o4X6532iC8vxYcpMSfEbQUU'
      }),
    );
    print('Response Status Code: ${updatedFirstNameResponse.statusCode}');
    print('Response Data: ${updatedFirstNameResponse.data}');
    print('first name: ${updatedFirstNameResponse.data['user']['firstName']}');
    if (updatedFirstNameResponse.statusCode == 200) {
      // Fetch the updated profile
      final updatedProfileResponse = await getUserProfile(dio);
      if (updatedProfileResponse != null &&
          updatedProfileResponse.statusCode == 200) {
        final updatedProfile =
            Profile.fromJson(updatedProfileResponse.data['user']);
        emit(ProfileLoaded(updatedProfile)); // Update the state with the new profile

        // Update the UI with the loaded profile data.
        firstNameController.text = updatedProfile.firstName ?? '';
        // lastNameController.text = updatedProfile.lastName ?? '';
        // cityController.text = updatedProfile.city ?? '';

        // Emit an event to indicate successful update if needed
        // emit(ProfileUpdatedSuccessMessage('First name updated successfully.'));
      } else {
        emit(ProfileError('Failed to fetch updated profile.'));
      }
    } else {
      emit(ProfileError(
          'Failed to update first name. Status Code: ${updatedFirstNameResponse.statusCode}'));
    }
  } catch (e) {
    // Handle other types of errors (if any)
    print('Error updating first name: $e');
    emit(ProfileError('Error updating first name: $e'));
  }
}


  Future<Profile> updateLastName(String lastName) async {
    final updatedLastNameResponse = await http.put(
        Uri.parse(
            'https://kemet-gp2024.onrender.com/api/v1/auth/updateProfile'),
        body: {
          'last_name': lastName
        },
        headers: {
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzIyNjQ3MX0.xdh7vU90JVafhJzzXua0o4X6532iC8vxYcpMSfEbQUU'
        });
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
}
  // Future<void> updatePhoto(File photo) async {

  //    var formData = FormData({
  //      'photo': await http.MultipartFile.fromPath('photo', photo.path)
  //    });
  //    var response = await http.put(Uri.parse(''),
  //        body: formData);

  //    emit(UserProfileUpdated());
  // }

