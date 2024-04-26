import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/cubit/search_cubit.dart';
import 'package:gp_project/views/legand_search_view.dart';

class LegendSearch extends StatelessWidget {
  const LegendSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child:  Scaffold(
        body: LegendSearchView(),
      ),
    );
  }
}
