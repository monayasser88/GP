import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:gp_project/models/ticket.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit() : super(TicketsInitial());
  Future<void> getTickets() async {
    try {
      var response = await http.get(Uri.parse(''));

      emit(TicketsLoaded(jsonDecode(response.body)));
    } catch (e) {
      // TODO
      emit(TicketsError('can not get tickets'));
    }
  }

  double total = 1;
  double price = 25.0;
  int selectedQuantity = 1;
  double? newTotal;
  int ticketIndex = 1;

  calculateTotal() {
    total = price * selectedQuantity;
    return total;
  }

  void updateQuantity(int newQuantity) {
    selectedQuantity = newQuantity;
    emit(QuantityChanged(selectedQuantity));
    calculateTotal();
  }

  void setTicketIndex(int index) {
    ticketIndex = index;
  }
}
