import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/views/change_password_view.dart';
import 'package:gp_project/cubit/change_password_cubit.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child:const Scaffold(
        body: ChangePasswordView(),
      ) ,
    );
  }
}