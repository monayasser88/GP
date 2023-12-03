import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
class TextFormFieldNewPassword extends StatefulWidget {
  const TextFormFieldNewPassword({super.key});

  @override
  State<TextFormFieldNewPassword> createState() => _TextFormFieldNewPasswordState();
}

class _TextFormFieldNewPasswordState extends State<TextFormFieldNewPassword> {
  bool _isnewPasswordVisible = false;
  final TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);
    return TextFormField(
                    decoration: InputDecoration(
                      label: const Text(
                        'Enter new Password',
                      ),
                      floatingLabelStyle: const TextStyle(color: kPrimaryColor),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide:
                              BorderSide(color: kPrimaryColor, width: 2)),
                      hintText: 'Enter new Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isnewPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors
                              .grey, // Change icon based on visibility status
                        ),
                        onPressed: () {
                          setState(() {
                            _isnewPasswordVisible = !_isnewPasswordVisible;
                            Colors.grey;
                          });
                        },
                      ),
                    ),
                    obscureText: !_isnewPasswordVisible,
                    controller: newPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        return 'Password must contain at least one number';
                      }
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Password must contain at least one uppercase letter';
                      }
                      if (!value.contains(RegExp(r'[a-z]'))) {
                        return 'Password must contain at least one lowercase letter';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      passNotifier.value =
                          PasswordStrength.calculate(text: value);
                    },
                  );
  }
}