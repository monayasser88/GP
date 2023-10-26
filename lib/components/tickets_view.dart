import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/tickets_list_view.dart';


class TicketsView extends StatelessWidget {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          SizedBox(
            height: 55,
          ),
          CustomAppBar(
            title: 'Tickets',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: TicketsListView())
        ],
      ),
    );
  }
}
