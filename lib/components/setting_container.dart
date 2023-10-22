import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/pages/profile.dart';

class SettingContainer extends StatelessWidget {
  const SettingContainer({super.key, required this.userName, required this.userEmail});
  final String userName;
  final String userEmail;
  @override
  Widget build(BuildContext context) {
    return Container(
              width: 354,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  //color: Colors.white,
                  border: Border.all(color: BorderColor, width: 1)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/logo3.jpg'),
                          radius: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                userName,
                                style: TextStyle(
                                    //color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                userEmail,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Profile();
                        }));
                      },
                      child: Container(
                          width: 24,
                          height: 24,
                          child: Image.asset('assets/edit.png')),
                    )
                  ],
                ),
              ),
            );
  }
}