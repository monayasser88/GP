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
            const SizedBox(
              height: 55,
            ),
            const CustomAppBar(title: 'Account'),
            const SizedBox(
              height: 29,
            ),
            const CustomEditPhoto(),
            const SizedBox(
              height: 27,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ProfilePage();
                }));
              },
              child:const ContainerAccount(
                  contName: 'Profile', contIcon: Icons.person_outline_rounded),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ChangePassword();
                }));
              },
              child:const ContainerAccount(
                  contName: 'Change Password',
                  contIcon: CupertinoIcons.lock_rotation_open),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Tickets();
                }));
              },
              child:const ContainerAccount(
                  contName: 'My Tickets', contIcon: CupertinoIcons.tickets),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }));
              },
              child:const ContainerAccount(
                  contName: 'Favorites', contIcon: CupertinoIcons.heart),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Setting();
                }));
              },
              child:const ContainerAccount(
                  contName: 'Setting', contIcon: Icons.settings_outlined),
            ),
            const SizedBox(
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

