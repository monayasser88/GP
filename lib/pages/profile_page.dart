import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/cubit/profile_cubit.dart';
import 'package:gp_project/views/profile_view.dart';

class ProfilePage extends StatelessWidget {
    ProfilePage({super.key});
  Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserProfile(dio),
      child: Scaffold(body: ProfileView()),
    );
  }
}
