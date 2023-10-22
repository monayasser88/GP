import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            //color: Colors.black,
          ),
        ),
        SizedBox(
          width: 125,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w900,
              //color: Colors.black
              ),
        ),
      ],
    );
  }
}
