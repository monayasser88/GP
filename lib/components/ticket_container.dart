import 'package:flutter/material.dart';
import 'package:gp_project/constraints.dart';

class TicketContainer extends StatelessWidget {
  const TicketContainer(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kPrimaryColor, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                description,
                //'pyramids plllllllllalalllllllllllllalalalalllll miuvhjhuygtvbmpmpmpmpmmpmmpmpmpmpmpkjhgfdsasdfghjkjhgfdfghj',
                style: const TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
                maxLines: 2,
              ),
            ],
          ),
        ));
  }
}
