import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/tickets_view.dart';
import 'package:gp_project/cubit/tickets_cubit.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TicketsCubit(),
      child:const Scaffold(
        body: TicketsView(),
      ),
    );
  }
}
