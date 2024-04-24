import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/change_password_cubit.dart';
import 'package:gp_project/pages/change_password.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class TextFormFieldConfirmPassword extends StatefulWidget {
  const TextFormFieldConfirmPassword({super.key});

  @override
  State<TextFormFieldConfirmPassword> createState() =>
      _TextFormFieldConfirmPasswordState();
}

class _TextFormFieldConfirmPasswordState
    extends State<TextFormFieldConfirmPassword> {
  bool _isconfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);
    return TextFormField(
      decoration: InputDecoration(
        label: const Text(
          'Enter confirm new Password',
        ),
        floatingLabelStyle: const TextStyle(color: kPrimaryColor),
        hintText: 'Enter confirm new Password',
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: kPrimaryColor, width: 2)),
        suffixIcon: IconButton(
          icon: Icon(
            _isconfirmPasswordVisible
                ? Icons.visibility
                : Icons
                    .visibility_off, // Change icon based on visibility status
          ),
          onPressed: () {
            setState(() {
              _isconfirmPasswordVisible = !_isconfirmPasswordVisible;
            });
            Colors.grey;
          },
        ),
      ),
      obscureText: !_isconfirmPasswordVisible,
      controller:ChangePasswordCubit.get(context).confirmNewPasswordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
      onChanged: (value) {
        passNotifier.value = PasswordStrength.calculate(text: value);
      },
    );
  }
}
