import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/views/favorites_view.dart';
//import 'package:gp_project/views/search_view.dart';
import 'package:gp_project/cubit/favorites_cubit.dart';
//import 'package:gp_project/pages/not_found.dart';
//import 'package:gp_project/components/search_view.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //  BlocProvider(
        //   create: (context) => FavoritesCubit(),
        //   child:
        const Scaffold(body: FavoritesView()
            //SearchView(),
            //NotFound()
            );
    // );
  }
}
