import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';

class CustomEditPhoto extends StatelessWidget {
  const CustomEditPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(image: AssetImage('assets/logo3.jpg')),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: KPrimaryColor,
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 16,
              ),
            ))
      ],
    );
  }
}
