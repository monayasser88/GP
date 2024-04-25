import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/ticket_container.dart';
import 'package:gp_project/components/total_container.dart';
import 'package:gp_project/cubit/tickets_cubit.dart';
import 'package:gp_project/models/tickets.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketsCubit, TicketsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! TicketsLoading ||
              state is TicketsSuccess ||
              state is TicketDeleteSuccess,
          builder: (BuildContext context) =>
              ticketsPage(TicketsCubit.get(context).myTicket!, context),
          fallback: (BuildContext context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget ticketsPage(MyTicket total, context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: total.myTicketItems.length,
              itemBuilder: (context, index) {
                MyTicketItem item = total.myTicketItems![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TicketContainer(
                    title: item.trip.title.toString(),
                    description: item.trip.description.toString(),
                    quantity: item.quantity.toString(),
                    price: item.price.toString(),
                    onPressed: () {
                      TicketsCubit.get(context).deleteTicket(Dio(), item.myTId);
                    },
                    quantityMinus: () {
                      TicketsCubit.get(context)
                          .quantityTicket(Dio(), item.myTId, item.quantity - 1);
                    },
                    quantityPlus: () {
                      TicketsCubit.get(context)
                          .quantityTicket(Dio(), item.myTId, item.quantity + 1);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          TotalContainer(total: total.totalPrice.toString()),
          const SizedBox(height: 10),
        ],
      );
}
