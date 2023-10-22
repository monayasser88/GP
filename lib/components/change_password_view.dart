import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/custom_appbar2.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/change_password_cubit.dart';
import 'package:gp_project/pages/account.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();

  String oldPassword = '';
  String newPassword = '';
  String confirmNewPassword = '';
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ChangePasswordSuccess) {
          if (confirmNewPassword == newPassword) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return Account();
              },
            ));
          }
        }
      },
      child: Scaffold(
        body: Form(
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
                  ),
                  obscureText: true,
                  onSaved: (value) => oldPassword = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your old password';
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
                  ),
                  onSaved: (value) => newPassword = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your new password';
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
                  ),
                  onSaved: (value) => confirmNewPassword = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your confirm new password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 70,
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
                    _formKey.currentState!.save();
                    context.read<ChangePasswordCubit>().changePassword(
                        oldPassword: oldPassword, newPassword: newPassword);
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
