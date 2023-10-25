import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:gp_project/models/ticket_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit() : super(TicketsInitial());
  Future<void> getTickets() async {
    emit(TicketsLoading());
    
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/tickets'));
      final tickets = (response.body as List).map((e) => e as Map<String, dynamic>).toList();
      
      emit(TicketsLoaded(tickets.cast<TicketModel>()));
      
    } catch (e) {
      emit(TicketsError(e.toString()));
    }
  }
}
