import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/favouite_container.dart';
import 'package:gp_project/cubit/favorites_cubit.dart';
import 'package:gp_project/models/favorites.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition:
              state is! FavoriteTripsLoading && state is FavoriteTripsSuccess ||
                  state is FavoritesDeleting,
          builder: (BuildContext context) => ListView.builder(
              itemBuilder: (context, index) => favList(
                  FavoritesCubit.get(context)
                      .tourismPlace
                      .wishListTourismPlace[index],
                  context),
              itemCount: FavoritesCubit.get(context)
                  .tourismPlace
                  .wishListTourismPlace
                  .length),
          fallback: (BuildContext context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget favList(TourismPlace fav, context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: GestureDetector(
          onTap: (){},
          child: FavoriteContainer(
            description: fav.informationAbout,
            title: fav.name,
            image: fav.imgCover,
            onPressed: () {
              FavoritesCubit.get(context)
                  .deleteFavoriteTourismPlaces(Dio(), fav.id);
            },
          ),
        ),
      );
}
