import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/pages/check_out.dart';

// ignore: must_be_immutable
class TotalContainer extends StatelessWidget {
  TotalContainer({super.key, required this.total});
  double? total;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 345,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(
              0,
              1.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 0,
          ), //BoxShadow
          //BoxShadow
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(children: [
              const Text(
                'Total:',
                style: TextStyle(
                    fontSize: 18,
                    color: kPrimaryColor,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                '\$' ' ${total.toString()}',
                style: const TextStyle(fontSize: 18, fontFamily: 'poppins'),
              ),
              const SizedBox(
                width: 7,
              ),
            ]),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CheckOut();
              }));
            },
            child: Container(
              height: 100,
              width: 120,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                color: kPrimaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'CheckOut',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins'),
                    ),
                    Icon(
                      Icons.attach_money_rounded,
                      size: 23,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
