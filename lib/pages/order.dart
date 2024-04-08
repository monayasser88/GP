import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/custom_field.dart';
import 'package:gp_project/components/delivary_pop_up.dart';
import 'package:gp_project/components/pay_field.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  GlobalKey<FormState> orderFormKey = GlobalKey();
  TextEditingController streetField = TextEditingController();
  TextEditingController cityField = TextEditingController();
  TextEditingController phoneField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: orderFormKey,
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
                controller: streetField,
                label: 'Street',
                hint: 'Enter your street!',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                controller:cityField ,
                label: 'City',
                hint: 'Enter your city!',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                controller: phoneField,
                label: 'Phone',
                hint: 'Enter your phone!',
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
                    ontap: () {
                      showCustomPopupdelivary(context);
                    },
                  ),
                ],
              )
            ])),
      ),
    ));
  }
}
