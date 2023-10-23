import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/custom_container_in_profile.dart';
import 'package:gp_project/components/custom_edit_photo.dart';
import 'package:gp_project/components/custom_pop_up.dart';
import 'package:gp_project/components/custom_title_in_profile.dart';
import 'package:gp_project/components/profile_view.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/profile_cubit.dart';
import 'package:gp_project/pages/change_password.dart';
import 'package:gp_project/pages/update_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProfileLoaded) {
            return ProfileView(profile: state.profile,);
          }
          return ProfileView();
        },
      )),
    );
  }
}
