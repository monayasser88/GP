import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/custom_container_in_account.dart';
import 'package:gp_project/components/custom_edit_photo.dart';
import 'package:gp_project/components/logout_pop_up.dart';
import 'package:gp_project/cubit/logout_cubit.dart';
import 'package:gp_project/pages/change_password.dart';
import 'package:gp_project/pages/favourites.dart';
import 'package:gp_project/pages/profile_page.dart';
import 'package:gp_project/pages/setting.dart';
import 'package:gp_project/pages/tickets.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  

  @override
  Widget build(BuildContext context) {
    final logoutCubit = BlocProvider.of<LogoutCubit>(context);
    return Scaffold(
      body: Padding(
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
                  return ProfilePage();
                }));
              },
              child: ContainerAccount(
                  contName: 'Profile', contIcon: Icons.person_outline_rounded),
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
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Tickets();
                }));
              },
              child: ContainerAccount(
                  contName: 'My Tickets', contIcon: CupertinoIcons.tickets),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Favorites();
                }));
              },
              child: ContainerAccount(
                  contName: 'Favorites', contIcon: CupertinoIcons.heart),
            ),
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
                showCustomPopup(context,logoutCubit);
              },
            ),
          ],
        ),
      ),
    );
  }
}

