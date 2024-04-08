import 'dart:convert';
import 'package:bloc/bloc.dart';
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

  Future<List<WishListItem>> fetchFavoriteTrips() async {
    final token = CacheHelper().getData(key: ApiKey.token);

    if (token == null) {
      emit(FavoriteTripsError('User ID not found in cache.'));
    }
    emit(FavoriteTripsLoading());
    try {
      var response = await api
          .get(EndPoint.tourismWishList, queryParameters: {'userId': token});
      if (response.statusCode == 200) {
        List<WishListItem> favoriteTrips = [];
        for (var tripData in jsonDecode(response.body)['wishListTrip']) {
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
