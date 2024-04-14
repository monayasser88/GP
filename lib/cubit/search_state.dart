part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}


class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Map<String, dynamic>> results;

  SearchLoaded(this.results);
}

class SearchError extends SearchState {}

class SearchHistory extends SearchState {
  final List<Map<String, dynamic>> history;

  SearchHistory(this.history);
}
class ClearedSearchState extends SearchState {}