import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/favorites_view.dart';
import 'package:gp_project/cubit/favorites_cubit.dart';
//import 'package:gp_project/components/search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(),
      child: const Scaffold(body: FavoritesView()
          // SearchView(),
          ),
    );
  }
}
