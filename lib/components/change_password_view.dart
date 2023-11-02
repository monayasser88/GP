import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/custom_appbar2.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/change_password_cubit.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  bool _isoldPasswordVisible = false;
  bool _isnewPasswordVisible = false;
  bool _isconfirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        // TODO: implement listener
          if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Password changed successfully'),
              duration: Duration(seconds: 3),
            ),
          );
        } else if (state is ChangePasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMassage),
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                ),
                CustomAppBar2(
                  title: 'Change Password',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: 58,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      'Enter Old Password',
                      style: TextStyle(color: KPrimaryColor),
                    ),
                    hintText: 'Enter Old Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: KPrimaryColor, width: 2)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isoldPasswordVisible
                            ? Icons.visibility
                            : Icons
                                .visibility_off, // Change icon based on visibility status
                      ),
                      onPressed: () {
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
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      'Enter new Password',
                      style: TextStyle(color: KPrimaryColor),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: KPrimaryColor, width: 2)),
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
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      'Enter confirm new Password',
                      style: TextStyle(color: KPrimaryColor),
                    ),
                    hintText: 'Enter confirm new Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: KPrimaryColor, width: 2)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isconfirmPasswordVisible
                            ? Icons.visibility
                            : Icons
                                .visibility_off, // Change icon based on visibility status
                      ),
                      onPressed: () {
                        setState(() {
                          _isconfirmPasswordVisible =
                              !_isconfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isconfirmPasswordVisible,
                  controller: confirmNewPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(354, 44)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(KPrimaryColor),
                  ),
                  onPressed: () {
                    final oldPassword = oldPasswordController.text;
                    final newPassword = newPasswordController.text;
                    final confirmNewPassword =
                        confirmNewPasswordController.text;
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    if (newPassword == confirmNewPassword) {
                      context
                          .read<ChangePasswordCubit>()
                          .changePassword(oldPassword, newPassword);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('New passwords do not match'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
