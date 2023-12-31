import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/services/search_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _repository = SearchRepository();

  SearchCubit() : super(SearchInitial());

  void search(String query) async {
    if (query.isEmpty) {
      emit(SearchHistory(await _repository.getSearchHistory()));
      return;
    }

    try {
      emit(SearchLoading());
      final List<String> results = await _repository.search(query);
      if (results.isNotEmpty) {
        emit(SearchLoaded(results));
      } else {
        emit(SearchError());
      }
    } catch (e) {
      emit(SearchError());
    }
  }

  void clearSearch() {
    emit(ClearedSearchState());
  }
}
