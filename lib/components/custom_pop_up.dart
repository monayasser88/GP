import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';

class CustomPopUp extends StatelessWidget {
  const CustomPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 600),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 24,
              ),
              Image(
                image: AssetImage('assets/congratsImage.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Are you sure',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'poppins',
                  //color: Colors.black
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'You are attending to log out , Are you sure?',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xffB68B25)),
                  minimumSize: MaterialStatePropertyAll(Size(340, 50)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  )),
                ),
                child: Text(
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
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        color: KPrimaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
