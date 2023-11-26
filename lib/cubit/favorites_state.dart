part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}
final class FavoritesLoaded extends FavoritesState {
  final List<Map<String, dynamic>> favorites;

  FavoritesLoaded(this.favorites);

}
final class FavoritesLoading extends FavoritesState {}
final class FavoritesError extends FavoritesState {
  final String errMassage;

  FavoritesError(this.errMassage);
}
