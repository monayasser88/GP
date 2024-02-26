import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class TextFormFieldOldPassword extends StatefulWidget {
  const TextFormFieldOldPassword({super.key});

  @override
  State<TextFormFieldOldPassword> createState() =>
      _TextFormFieldOldPasswordState();
}

class _TextFormFieldOldPasswordState extends State<TextFormFieldOldPassword> {
  final TextEditingController oldPasswordController = TextEditingController();
  bool _isoldPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);
    return TextFormField(
      decoration: InputDecoration(
        label: const Text(
          'Enter Old Password',
        ),
        floatingLabelStyle: const TextStyle(color: kPrimaryColor),
        hintText: 'Enter Old Password',
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: kPrimaryColor, width: 2)),
        suffixIcon: IconButton(
          icon: Icon(
            _isoldPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            Colors.grey;
            setState(() {
              _isoldPasswordVisible = !_isoldPasswordVisible;
            });
          },
        ),
      ),
      obscureText: !_isoldPasswordVisible,
      controller: oldPasswordController,
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
