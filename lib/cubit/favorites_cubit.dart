import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gp_project/cache/cache_helper.dart';
import 'package:gp_project/core/api/api_consumer.dart';
import 'package:gp_project/core/api/end_ponits.dart';
import 'package:gp_project/models/favorites.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.api) : super(FavoritesInitial());
  ApiConsumer api;

  Future<List<WishListItem>> fetchFavoriteTrips(Dio dio) async {
    final token = CacheHelper().getData(key: ApiKey.token);

    if (token == null) {
      emit(FavoriteTripsError('User ID not found in cache.'));
    }
    emit(FavoriteTripsLoading());
    try {
      var response = await dio
          .get(EndPoint.tourismWishList,options: Options(headers: {'token' : token}));
      if (response.statusCode == 200) {
        List<WishListItem> favoriteTrips = [];
        for (var tripData in jsonDecode(response.data)['wishListTrip']) {
          WishListItem trip = WishListItem.fromJson(tripData);
          favoriteTrips.add(trip);
        }
        emit(FavoriteTripsSuccess());
        return favoriteTrips;
      } else {
        emit(FavoriteTripsError(
            'Failed to load favorite trips. Please try again later.'));
        return [];
      }
    } catch (error) {
      emit(FavoriteTripsError(
          'An error occurred while fetching favorite trips.'));
      return [];
    }
  }
}
