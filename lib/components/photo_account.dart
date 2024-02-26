import 'package:flutter/material.dart';

class PhotoAccount extends StatelessWidget {
  const PhotoAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 120,
        height: 120,
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          backgroundImage:const AssetImage("assets/person.png"),
        ));
  }
}
