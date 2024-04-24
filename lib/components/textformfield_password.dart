import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/change_password_cubit.dart';

class TextFormFieldNewPassword extends StatefulWidget {
    const TextFormFieldNewPassword({super.key});

  @override
  State<TextFormFieldNewPassword> createState() =>
      _TextFormFieldNewPasswordState();
}
//final TextEditingController newPasswordController = TextEditingController();
class _TextFormFieldNewPasswordState extends State<TextFormFieldNewPassword> {
  bool _isnewPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
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
            borderSide: BorderSide(color: kPrimaryColor, width: 2)),
        hintText: 'Enter new Password',
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(
            _isnewPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
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
      controller: ChangePasswordCubit.get(context).newPasswordController,
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
    );
  }
}
