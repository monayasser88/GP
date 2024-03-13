import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/custom_field.dart';
import 'package:gp_project/components/pay_field.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(children: [
            const SizedBox(
              height: 55,
            ),
            CustomAppBar(
              title: 'Order',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              height: 45,
            ),
            CustomField(
              label: 'Name',
              hint: 'Enter your name!',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomField(
              label: 'Phone',
              hint: 'Enter your phone!',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomField(
              label: 'Address',
              hint: 'Enter your address!',
            ),
            const SizedBox(
              height: 450,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PayField(
                  text: 'Pay Online',
                  ontap: () {},
                ),
                SizedBox(
                  width: 15,
                ),
                PayField(
                  text: 'Pay Cash',
                  ontap: () {},
                ),
              ],
            )
          ])),
    ));
  }
}
