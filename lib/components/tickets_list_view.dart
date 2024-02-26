import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/ticket_container.dart';
//import 'package:gp_project/cubit/tickets_cubit.dart';

class TicketsListView extends StatefulWidget {
  const TicketsListView({super.key});

  @override
  State<TicketsListView> createState() => _TicketsListViewState();
}

class _TicketsListViewState extends State<TicketsListView> {
  double? total;
  @override
  Widget build(BuildContext context) {
    //return BlocBuilder<TicketsCubit, TicketsState>(builder: (context, state) {
    // if (state is TicketsInitial) {
    //   context.read<TicketsCubit>().getTickets;
    //   return const Center(child: CircularProgressIndicator());
    // }
    // if (state is TicketsLoaded) {
    return ListView.builder(
        itemCount: 5,
        //state.tickets.length,
        itemBuilder: (context, index) {
          //var ticket = state.tickets[index];
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: TicketContainer(
                onTotalChanged: (newTotal) {
                  setState(() {
                    total = newTotal;
                  });
                },
                price: 200,
                // title: ticket['title'],
                //description: ticket['description']));
              ));
        });
  }
}
    //);
  //}
//}
