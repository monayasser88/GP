import 'package:flutter/material.dart';

class ErrorPopUp extends StatelessWidget {
  const ErrorPopUp({super.key});

  @override
  Widget build(BuildContext context) {
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
                image: AssetImage('assets/Paymet.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Congratulations',
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
                'Your account has been created',
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
                  'Lets Start',
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
            ],
          ),
        ),
      ),
    );
  }
}
void showCustomPopupError(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return const ErrorPopUp();
    },
  );
}