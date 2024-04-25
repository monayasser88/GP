import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/cubit/tickets_cubit.dart';
import 'package:gp_project/views/tickets_view.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        const SizedBox(height: 55),
        CustomAppBar(
          title: 'Tickets',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(height: 10),
        Expanded(
              child: BlocProvider(
                create: (context) => TicketsCubit()..getReservedTickets(Dio()),
                child: const TicketsView(),
              ),
            ),
      ]),
    ));
  }
}
