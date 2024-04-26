import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/cache/cache_helper.dart';
import 'package:gp_project/core/api/end_ponits.dart';
import 'package:gp_project/core/errors/exceptions.dart';
import 'package:gp_project/models/ticket.dart';
import 'package:gp_project/models/tickets.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  MyTicket? myTicket;
  TicketsCubit() : super(TicketsInitial());
  static TicketsCubit get(context) => BlocProvider.of(context);

  TextEditingController streetField = TextEditingController();
  TextEditingController cityField = TextEditingController();
  TextEditingController phoneField = TextEditingController();
  void getReservedTickets(Dio dio) async {
    emit(TicketsLoading());
    try {
      final response = await dio.get(EndPoint.ticketsList,
          options: Options(headers: {
            'token':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzkzMjM5MX0.9k5gc5VoxtY772RQIhELvJFzpoj7Ai9Q3YZI-vdrtFc'
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap =
            response.data['myTicket'] as Map<String, dynamic>;
        if (jsonMap != null) {
          myTicket = MyTicket.fromJson(jsonMap);
          print(myTicket);
          final myTickId = myTicket!.id;
          CacheHelper().saveData(key: ApiKey.TId, value: myTicket!.id);
          //CacheHelper().saveData(key:  ,value: )
          emit(TicketsSuccess());
        }
      }
    } on ServerException catch (error) {
      print(error.toString());
      emit(TicketsError('can not load tourism places '));
    }
  }

  void deleteTicket(Dio dio, String TripId) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(TicketsLoading());
    try {
      var response = await dio.delete(EndPoint.deleteTicket(TripId),
          options: Options(headers: {
            'token':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzkzMjM5MX0.9k5gc5VoxtY772RQIhELvJFzpoj7Ai9Q3YZI-vdrtFc'
          }));
      if (response.statusCode == 200) {
        //Future.delayed(const Duration(seconds: 2));
        emit(TicketDeleteSuccess());
        getReservedTickets(dio);
      } else {
        emit(TicketsError('Failed to delete favorite tourism place.'));
      }
    } catch (error) {
      print(error.toString());
      emit(TicketsError('Failed to delete favorite tourism place.'));
    }
  }

  void quantityTicket(Dio dio, String TripId, int quantity) async {
    // final token = CacheHelper().getData(key: ApiKey.token);
    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(TicketsLoading());
    try {
      var response = await dio.put(EndPoint.quantityTicket(TripId),
          data: {'quantity': quantity},
          options: Options(headers: {
            'token':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzkzMjM5MX0.9k5gc5VoxtY772RQIhELvJFzpoj7Ai9Q3YZI-vdrtFc'
          }));
      print('Response Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        //Future.delayed(const Duration(seconds: 2));
        emit(TicketUpdateSuccess());
        getReservedTickets(dio);
      } else {
        emit(TicketsError('Failed to delete favorite tourism place.'));
      }
    } catch (error) {
      print(error.toString());
      emit(TicketsError('Failed to delete favorite tourism place.'));
    }
  }


  void createOrder(Dio dio) async {
    emit(ShippingLoading());
    //final token = CacheHelper().getData(key: ApiKey.token);
    // if (token == null) {
    //   emit(ShippingError('User ID not found in cache.'));
    // }
    try {
      final response = await dio.post(
          EndPoint.createOrder(CacheHelper().getDataString(key: ApiKey.TId)),
          data: {
            'shippingAddress': {
              "street": streetField.text,
              "city": cityField.text,
              "phone": phoneField.text
            },
          },
          options: Options(headers: {
            'token':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzkzMjM5MX0.9k5gc5VoxtY772RQIhELvJFzpoj7Ai9Q3YZI-vdrtFc'
          }));
      //final decodedToken = JwtDecoder.decode(token);
      //CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      print(response.data);
        emit(ShippingSuccess());
        //getReservedTickets(dio);
        return response.data['msg'];
    } catch (e) {
      if (e is ServerException) {
        emit(ShippingError(e.errModel.errorMessage));
      } else {
        emit(ShippingError('An error occurred while changing the password.'));
      }
      throw 'An error occurred while changing the password.';
    }
  }
}
