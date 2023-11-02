import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/custom_container_in_profile.dart';
import 'package:gp_project/components/custom_edit_photo.dart';
import 'package:gp_project/components/custom_title_in_profile.dart';
import 'package:gp_project/components/logout_pop_up.dart';
import 'package:gp_project/components/update_pop_up.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/profile_cubit.dart';
import 'package:gp_project/models/user_model';
import 'package:gp_project/pages/change_password.dart';
import 'package:gp_project/pages/update_profile.dart';

class ProfileView extends StatefulWidget {
  final Profile? profile;
  const ProfileView({super.key, this.profile});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  void showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LogOutPopUp();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: SingleChildScrollView(
        child: Container(
          height: 600,
          child: Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              CustomAppBar(
                title: 'Profile',
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomEditPhoto(),
              const SizedBox(
                height: 20,
              ),
              CustomTitle(
                titleProfile: 'First name',
                onTap: () {
                  showUpdateDialog(
                      context, 'Update First Name', 'Enter First Name');
                },
                //userInfo: profile!.firstName.toString(),
                userInfo: 'mona',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTitle(
                titleProfile: 'Last name',
                onTap: () {
                  showUpdateDialog(
                      context, 'Update Last Name', 'Enter Last Name');
                },
                //userInfo: profile!.lastName.toString(),
                userInfo: 'yasser',
              ),
              const SizedBox(
                height: 10,
              ),
              const Flexible(
                child: Divider(
                  thickness: 1,
                  color: Color(0xff92929D),
                  indent: 5,
                  endIndent: 5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTitle(
                titleProfile: 'Email',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return UpdateProfile();
                  }));
                },
                userInfo: 'mona@gmail.com',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTitle(
                titleProfile: 'City',
                onTap: () {
                  showUpdateDialog(
                      context, 'Update City', 'Enter City');
                },
                userInfo: 'cairo',
              ),
              const SizedBox(
                height: 10,
              ),
              const Flexible(
                child: Divider(
                  thickness: 1,
                  color: Color(0xff92929D),
                  indent: 5,
                  endIndent: 5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ContainerProfile(
                forwardName: 'Change Password',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangePassword();
                  }));
                },
              ),
              ContainerProfile(
                forwardName: 'Log out',
                color: KPrimaryColor,
                onTap: () {
                  showCustomPopup(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

final cubit = ProfileCubit();
void updateProfileField(String field, String value) {
  switch (field) {
    case 'firstName':
      cubit.updateFirstName(value);
      break;

    case 'lastName':
      cubit.updateLastName(value);
      break;

    // etc
  }
}
