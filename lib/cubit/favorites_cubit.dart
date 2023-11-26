import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

    Future<void> fetchFavorites() async {
      try {
        var response = await http.get(Uri.parse(''));

        emit(FavoritesLoaded(jsonDecode(response.body)));
      } catch (e) {
        // TODO
        emit(FavoritesError('there is an error'));
      }
    }
}
