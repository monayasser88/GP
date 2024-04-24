part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}
final class FavoriteTripsSuccess extends FavoritesState {
}
final class FavoriteTripsLoading extends FavoritesState {}
final class FavoritesDeleting extends FavoritesState {}
final class FavoriteTripsError extends FavoritesState {
  final String errMassage;

  FavoriteTripsError(this.errMassage);
}
