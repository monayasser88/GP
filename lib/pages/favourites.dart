import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.red, // Color for the top border
              width: 2.0, // Adjust the border width as needed
            ),
            right: BorderSide(
              style: BorderStyle.solid,
              color: Colors.red, // Color for the right border
              width: 2.0, // Adjust the border width as needed
            ),
          ),
        ),
        child: Text(
          'Hello, world!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
