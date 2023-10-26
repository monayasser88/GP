import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

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
}
