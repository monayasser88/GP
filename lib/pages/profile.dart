import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
            CustomAppBar(title: 'Profile',
            onTap: () {
                Navigator.of(context).pop();
              },)
          ],
        ),
      ),
    );
  }
}