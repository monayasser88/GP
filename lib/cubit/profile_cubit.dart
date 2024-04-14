import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gp_project/core/errors/exceptions.dart';
import 'package:gp_project/models/user_model';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  Future getUserProfile(Dio dio) async {
    try {
      emit(ProfileLoading());

      final response = await dio.get(
        'https://kemet-gp2024.onrender.com/api/v1/auth/profile',
        options: Options(headers: {
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjE4YmNhZmQ2M2ExY2M3ZjhmZGE4MWIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzA1OTA5Nn0.s30CHAPbsunogUMKv8FJRpM1UNg3eCnAdoywz7XEC9k'
        }), // Add token in the header
      );

      final profile = Profile.fromJson(response.data);
      emit(ProfileLoaded(profile));
    } on ServerException catch (e) {
      emit(ProfileError('Failed to fetch user profile'));
    }
  }

  Future<Profile> updateFirstName(String firstName) async {
    var updatedFirstNameResponse =
        await http.put(Uri.parse(''), body: {'firstName': firstName});

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
