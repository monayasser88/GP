import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/custom_container_in_setting.dart';
import 'package:gp_project/components/custom_divider.dart';
import 'package:gp_project/components/dark_mode_container.dart';
import 'package:gp_project/components/setting_container.dart';
import 'package:gp_project/pages/privacy.dart';
import 'package:gp_project/pages/profile.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            SizedBox(
              height: 55,
            ),
            CustomAppBar(
              title: 'Setting',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: 23,
            ),
            SettingContainer(
                userName: 'Ahmed', userEmail: 'example@gmail.com'),
            SizedBox(
              height: 50,
            ),
            CustomDivider(
              divName: 'Account',
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Profile();
                  }));
                },
                child: CustomContainerSetting(
                  tileName: 'Profile',
                  icon: Icons.person_outline_rounded,
                )),
            SizedBox(
              height: 10,
            ),
            CustomContainerSetting(
              tileName: 'Change Password',
              icon: CupertinoIcons.lock_rotation_open,
            ),
            SizedBox(
              height: 10,
            ),
            CustomDivider(divName: 'General'),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Privacy();
                }));
              },
              child: CustomContainerSetting(
                tileName: 'Policy',
                icon: Icons.privacy_tip_outlined,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DarkMode()
          ],
        ),
      ),
    );
  }
}
