import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/favorites_list_view.dart';
import 'package:gp_project/cubit/favorites_cubit.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            CustomAppBar(
              title: 'Favorites',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              height: 5,
            ),
              Expanded(
                child: BlocProvider(
              create: (context) => FavoritesCubit()..fetchFavoriteTourismPlaces(Dio()),
              child: FavoritesListView(),
            ))
          ],
        ),
      ),
    );
  }
}
