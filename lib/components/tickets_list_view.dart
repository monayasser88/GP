import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/tickets_cubit.dart';

class TicketsListView extends StatelessWidget {
  const TicketsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsCubit, TicketsState>(
      builder: (context, state) {
        if (state is TicketsInitial) {
          context.read<TicketsCubit>().getTickets;
          return Center(child: CircularProgressIndicator());
        }
        if (state is TicketsLoaded) {
          return ListView.builder(
            itemCount: state.tickets.length,
            itemBuilder: (context, index) {
            var ticket = state.tickets[index];
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border(left: BorderSide(color: KPrimaryColor,width: 2),bottom: BorderSide(color: KPrimaryColor,width: 2),)
                      //Border.all(color: KPrimaryColor, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket['title'],
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ticket['description'],
                            //'pyramids plllllllllalalllllllllllllalalalalllll miuvhjhuygtvbmpmpmpmpmmpmmpmpmpmpmpkjhgfdsasdfghjkjhgfdfghj',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    )));
          });
        }
        return  Container();
      },
    );
  }
}
