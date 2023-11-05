import 'package:flutter/material.dart';
import 'package:gp_project/components/search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchView(),
    );
  }
}