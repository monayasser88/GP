import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 55,
            ),
            CustomAppBar(
              title: 'Policy',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Terms of use',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                //color: Colors.black
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Last Updated : ',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 14,
                fontWeight: FontWeight.w200,
                //color: Colors.black
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Please read this terms carefully before using our service',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                //color: Colors.black
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Defintions',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                //color: Colors.black
              ),
            )
          ],
        ),
      ),
    );
  }
}
