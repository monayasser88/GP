import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/ticket_container.dart';
import 'package:gp_project/cubit/tickets_cubit.dart';
//import 'package:gp_project/cubit/tickets_cubit.dart';

class TicketsListView extends StatelessWidget {
  const TicketsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: TicketContainer(
              title: '',
              description: '',
              quantity: '',
              price: '',
            ));
      },
    );
  }
}
    //);
  //}
//}
