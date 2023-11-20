import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/logout_cubit.dart';
import 'package:gp_project/pages/account.dart';

class LogOutPopUp extends StatelessWidget {
  const LogOutPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final logoutCubit = context.read<LogoutCubit>();
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Image(
                image: AssetImage('assets/congratsImage.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Are you sure',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'poppins',
                  //color: Colors.black
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'You are attending to log out , Are you sure?',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xffB68B25)),
                  minimumSize: MaterialStatePropertyAll(Size(340, 50)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  )),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                  onTap: () {
                    logoutCubit.logout();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return  Account();
                    }));
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        color: KPrimaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> showCustomPopup(
    BuildContext context, LogoutCubit logoutCubit) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return const LogOutPopUp();
    },
  );
}
