import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/favouite_container.dart';
import 'package:gp_project/cubit/favorites_cubit.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
      if (state is FavoritesInitial) {
        context.read<FavoritesCubit>().fetchFavorites();
        return const Center(child: CircularProgressIndicator());
      }
      if (state is FavoritesLoaded) {
        return ListView.builder(
          itemCount: state.favorites.length,
          itemBuilder: (context, index) {
            var favorite = state.favorites[index];
            return  Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: FavoriteContainer(
                description: favorite['description'],
                title: favorite['title'],
                image: favorite['image'],
              ),
            );
          },
        );
      }
      return Container();
    });
  }
}
