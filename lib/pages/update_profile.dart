import 'package:flutter/material.dart';
import 'package:gp_project/components/button_email.dart';
import 'package:gp_project/components/custom_appbar2.dart';
import 'package:gp_project/components/email_field.dart';
import 'package:gp_project/components/update_email_text.dart';
import 'package:gp_project/pages/verification_code.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              CustomAppBar2(
                title: '',
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 150),
                      SLtext(
                        text: 'Enter your Email',
                        size: 20,
                        weight: FontWeight.w600,
                      ),
                      const SizedBox(height: 20),
                      SLtext(
                        text: "We will send a confirmation code to your Email",
                        color: const Color(0xff92929D),
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                      const SizedBox(height: 20),
                      const EmailField(),
                      const SizedBox(height: 270),
                      ButtonEmail(
                        text: 'Send',
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return const Verification();
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
