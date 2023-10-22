import 'package:flutter/material.dart';
import 'package:gp_project/main.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354,
      height: 45,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.dark_mode_outlined,
                  size: 20,
                  //color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600,
                    //color: Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
                icon: Icon(GProject.themeNotifier.value == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode),
                onPressed: () {
                  GProject.themeNotifier.value =
                      GProject.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                })
          ],
        ),
      ),
    );
  }
}
