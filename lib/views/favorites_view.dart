import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/favorites_list_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          const Expanded(child: FavoritesListView())
        ],
      ),
    );
  }
}
