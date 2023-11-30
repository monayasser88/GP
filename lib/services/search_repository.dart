import 'dart:convert';

import 'package:http/http.dart' as http;

class SearchRepository {
  Future<List<String>> search(String query) async {
    final url = 'monibibi$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<String> results = List<String>.from(data['results']);
      return results;
    } else {
      throw Exception('Failed to fetch search results');
    }
  }

  Future<List<String>> getSearchHistory() async {
    const url = '';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<String> history = List<String>.from(data['history']);
      return history;
    } else {
      throw Exception('Failed to fetch search history');
    }
  }
}
