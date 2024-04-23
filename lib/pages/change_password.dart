import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/core/api/api_consumer.dart';
import 'package:gp_project/core/api/dio_consumer.dart';
import 'package:gp_project/views/change_password_view.dart';
import 'package:gp_project/cubit/change_password_cubit.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Scaffold(
        body: ChangePasswordView(),
      ),
    );
  }
}
