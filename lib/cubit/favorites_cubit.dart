import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/core/api/end_ponits.dart';
import 'package:gp_project/core/errors/exceptions.dart';
import 'package:gp_project/models/favorites.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  static FavoritesCubit get(context) => BlocProvider.of(context);
  // Future<List<WishListItem>> fetchFavoriteTrips(Dio dio) async {
  //   final token = CacheHelper().getData(key: ApiKey.token);

  //   if (token == null) {
  //     emit(FavoriteTripsError('User ID not found in cache.'));
  //   }
  //   emit(FavoriteTripsLoading());
  //   try {
  //     var response = await dio.get(EndPoint.tourismWishList,
  //         options: Options(headers: {'token': token}));
  //     if (response.statusCode == 200) {
  //       List<WishListItem> favoriteTrips = [];
  //       for (var tripData in jsonDecode(response.data)['wishListTrip']) {
  //         WishListItem trip = WishListItem.fromJson(tripData);
  //         favoriteTrips.add(trip);
  //       }
  //       emit(FavoriteTripsSuccess(favoriteTrips));
  //       return favoriteTrips;
  //     } else {
  //       emit(FavoriteTripsError(
  //           'Failed to load favorite trips. Please try again later.'));
  //       return [];
  //     }
  //   } catch (error) {
  //     emit(FavoriteTripsError(
  //         'An error occurred while fetching favorite trips.'));
  //     return [];
  //   }
  // }

  late WishlistResponse tourismPlace;
  void fetchFavoriteTourismPlaces(Dio dio) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(FavoriteTripsLoading());
    try {
      var response = await dio.get(EndPoint.tourismWishList,
          options: Options(headers: {
            'token':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzkzMjM5MX0.9k5gc5VoxtY772RQIhELvJFzpoj7Ai9Q3YZI-vdrtFc'
          }));
      tourismPlace = WishlistResponse.fromJson(response.data);
      emit(FavoriteTripsSuccess());
    } on ServerException catch (error) {
      print(error.toString());
      emit(FavoriteTripsError('can not load tourism places '));
    }
  }

  void deleteFavoriteTourismPlaces(Dio dio, String favId) async {
    // final token = CacheHelper().getData(key: ApiKey.token);

    // if (token == null) {
    //   emit(FavoriteTripsError('User ID not found in cache.'));
    // }
    emit(FavoriteTripsLoading());
    try {
      var response = await dio.delete(EndPoint.deleteTourismWishList(favId),
          options: Options(headers: {
            'token':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjFjNmI5MzY3OTkzMmU2Nzc3MTg5YWMiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzkzMjM5MX0.9k5gc5VoxtY772RQIhELvJFzpoj7Ai9Q3YZI-vdrtFc'
          }));
      if (response.statusCode == 200) {
        Future.delayed(const Duration(seconds: 2));
        fetchFavoriteTourismPlaces(dio);
        emit(FavoritesDeleting());
      } else {
        emit(FavoriteTripsError('Failed to delete favorite tourism place.'));
      }
    } catch (error) {
      print(error.toString());
      emit(FavoriteTripsError('Failed to delete favorite tourism place.'));
    }
  }
}
