import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:gp_project/cache/cache_helper.dart';
import 'package:gp_project/core/api/end_ponits.dart';
import 'package:gp_project/core/errors/exceptions.dart';
import 'package:gp_project/models/shipping.dart';
import 'package:gp_project/models/ticket.dart';
import 'package:gp_project/models/tickets.dart';
import 'package:http/http.dart' as http;
import 'package:gp_project/core/api/api_consumer.dart';
import 'package:meta/meta.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit(this.api) : super(TicketsInitial());
  Future<void> getTickets() async {
    try {
      var response = await http.get(Uri.parse(''));

      emit(TicketsSuccess());
    } catch (e) {
      // TODO
      emit(TicketsError('can not get tickets'));
    }
  }

  ApiConsumer api;
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

  Future<List<MyTicket>> getReservedTickets() async {
    final token = CacheHelper().getData(key: ApiKey.token);
    String? myTicketId = CacheHelper().getData(key: 'myTicketId');

    if (token == null) {
      emit(TicketsError('User ID not found in cache.'));
    }

    emit(TicketsLoading());

    try {
      var response = await api.get(EndPoint.getUserLoggedTickets,
          queryParameters: {'token': token});
      List<MyTicket> reservedTickets = [];

      // Save myTicket ID if not already saved
      if (myTicketId == null) {
        myTicketId = response.data['myTicket']['_id'];
        CacheHelper().saveData(key: 'myTicketId', value: myTicketId);
      }

      for (var ticketData in response.data['myTicketItems']) {
        MyTicket ticket = MyTicket.fromJson(ticketData);
        reservedTickets.add(ticket);
      }

      emit(TicketsSuccess());
      return reservedTickets;
    } catch (error) {
      if (error is ServerException) {
        emit(TicketsError(error.errModel.errorMessage));
      } else {
        emit(TicketsError('An error occurred while getting tickets.'));
      }
      return [];
    }
  }

  Future<String> createOrder(ShippingAddress shippingAddress) async {
    emit(ShippingLoading());
    //String? myTicketId = CacheHelper().getData(key: 'myTicketId');
    final token = CacheHelper().getData(key: ApiKey.token);
    if (token == null) {
      emit(ShippingError('User ID not found in cache.'));
    }
    try {
      final response = await api.post(
        EndPoint.createOrder(CacheHelper().getData(key: 'myTicketId')),
        data: {
          'shippingAddress': shippingAddress.toJson(),
        },
      );
      //final decodedToken = JwtDecoder.decode(token);
      //CacheHelper().saveData(key: ApiKey.token, value: response.token);
      //CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

      if (response['msg'] == 'success') {
        emit(ShippingSuccess());
        // Password change successful
        return response['msg'];
      } else {
        throw response['msg'] ?? 'Failed to change password.';
      }
    } catch (e) {
      if (e is ServerException) {
        emit(ShippingError(e.errModel.errorMessage));
      } else {
        emit(ShippingError(
            'An error occurred while changing the password.'));
      }
      throw 'An error occurred while changing the password.';
    }
  }
}
