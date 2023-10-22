import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/custom_container_in_account.dart';
import 'package:gp_project/components/custom_edit_photo.dart';
import 'package:gp_project/components/custom_pop_up.dart';
import 'package:gp_project/pages/change_password.dart';
import 'package:gp_project/pages/profile.dart';
import 'package:gp_project/pages/setting.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  void _showCustomPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomPopUp();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              SizedBox(
                height: 55,
              ),
              CustomAppBar(title: 'Account'),
              SizedBox(
                height: 29,
              ),
              CustomEditPhoto(),
              SizedBox(
                height: 27,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Profile();
                  }));
                },
                child: ContainerAccount(
                    contName: 'Profile',
                    contIcon: Icons.person_outline_rounded),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangePassword();
                  }));
                },
                child: ContainerAccount(
                    contName: 'Change Password',
                    contIcon: CupertinoIcons.lock_rotation_open),
              ),
              SizedBox(
                height: 15,
              ),
              ContainerAccount(
                  contName: 'My Tickets', contIcon: CupertinoIcons.tickets),
              SizedBox(
                height: 15,
              ),
              ContainerAccount(
                  contName: 'Favourites', contIcon: CupertinoIcons.heart),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Setting();
                  }));
                },
                child: ContainerAccount(
                    contName: 'Setting', contIcon: Icons.settings_outlined),
              ),
              SizedBox(
                height: 15,
              ),
              ContainerAccount(
                contName: 'Log Out',
                contIcon: Icons.logout,
                onTap: () {
                  _showCustomPopup(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
