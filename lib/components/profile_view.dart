import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/custom_container_in_profile.dart';
import 'package:gp_project/components/custom_edit_photo.dart';
import 'package:gp_project/components/custom_pop_up.dart';
import 'package:gp_project/components/custom_title_in_profile.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/models/user_model';
import 'package:gp_project/pages/change_password.dart';
import 'package:gp_project/pages/update_profile.dart';

class ProfileView extends StatelessWidget {
  final Profile? profile;
  const ProfileView({super.key, this.profile});
  void showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomPopUp();
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          CustomAppBar(
            title: 'Profile',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: 24,
          ),
          CustomEditPhoto(),
          SizedBox(
            height: 25,
          ),
          CustomTitle(
            titleProfile: 'First name',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return UpdateProfile();
              }));
            },
            userInfo: 'mona',
          ),
          SizedBox(
            height: 15,
          ),
          CustomTitle(
            titleProfile: 'Last name',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return UpdateProfile();
              }));
            },
            userInfo: 'yasser',
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: Divider(
              thickness: 1,
              color: Color(0xff92929D),
              indent: 5,
              endIndent: 5,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomTitle(
            titleProfile: 'Email',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return UpdateProfile();
              }));
            },
            userInfo: 'mona@gmail.com',
          ),
          SizedBox(
            height: 15,
          ),
          CustomTitle(
            titleProfile: 'City',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return UpdateProfile();
              }));
            },
            userInfo: 'cairo',
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: Divider(
              thickness: 1,
              color: Color(0xff92929D),
              indent: 5,
              endIndent: 5,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ContainerProfile(
            forwardName: 'Change Password',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
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
    );
  }
}
