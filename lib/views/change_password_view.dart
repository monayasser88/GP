import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/custom_appbar2.dart';
import 'package:gp_project/components/textformfield_confirm_password.dart';
import 'package:gp_project/components/textformfield_old_password.dart';
import 'package:gp_project/components/textformfield_password.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/change_password_cubit.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

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


  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password changed successfully'),
              duration: Duration(seconds: 3),
            ),
          );
        } else if (state is ChangePasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMassage),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  CustomAppBar2(
                    title: 'Change Password',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  const TextFormFieldOldPassword(),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextFormFieldNewPassword(),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextFormFieldConfirmPassword(),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordStrengthChecker(
                    strength: passNotifier,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(354, 44)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(kPrimaryColor),
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
                          const SnackBar(
                            content: Text('New passwords do not match'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Update',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
