import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gp_project/components/button_email.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/error_pop_up.dart';
import 'package:gp_project/components/update_email_text.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool _onEditing = true;

  String? _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              CustomAppBar(
                title: '',
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 195),
              SLtext(
                text: 'Enter verification code',
                size: 20,
                weight: FontWeight.w600,
              ),
              const SizedBox(height: 20),
              SLtext(
                text: "We’ve sent a code to xxxxx@example.com",
                color: const Color(0xff92929D),
                size: 14,
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 20),
              Center(
                child: VerificationCode(
                  textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color(0xffB68B25),
                      ),
                  keyboardType: TextInputType.number,
                  underlineColor: Colors
                      .amber, // If this is null it will use primaryColor: Colors.red from Theme
                  length: 4,
                  cursorColor: const Color(0xffB68B25),

                  clearAll: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'clear all',
                      style: TextStyle(
                        fontSize: 14.0,
                        decoration: TextDecoration.underline,
                        color: Color(0xffB68B25),
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.all(12),
                  onCompleted: (String value) {
                    setState(() {
                      _code = value;
                    });
                  },
                  onEditing: (bool value) {
                    setState(() {
                      _onEditing = value;
                    });
                    if (!_onEditing) FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: _onEditing
                      ? const Text('Please enter full code')
                      : Text('Your code: $_code'),
                ),
              ),
              const SizedBox(height: 190),
              SLtext(
                text: 'Don’t get code? Resend',
                color: const Color(0xff92929D),
                size: 12,
                weight: FontWeight.w400,
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonEmail(
                text: 'Verify',
                ontap: () {
                  showCustomPopupError(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (BuildContext context) {
                  //     return ();
                  //   }),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
