import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/components/search_field.dart';
import 'package:gp_project/cubit/search_cubit.dart';
import 'package:gp_project/pages/account.dart';
import 'package:gp_project/pages/not_found.dart';

class GovernorateSearchView extends StatelessWidget {
  GovernorateSearchView({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchError) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const NotFound();
          }));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 55,
                ),
                CustomAppBar(
                  title: 'Search',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Account()),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SearchField(
                  label: 'Search',
                  hint: 'search',
                  controller: _searchController,
                  onPressed: () {
                    context
                        .read<SearchCubit>()
                        .governorateSearch(_searchController.text);
                  },
                ),
                if (state is SearchLoading)
                  const Center(child: CircularProgressIndicator())
                else if (state is SearchLoaded)
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.results.length,
                      itemBuilder: (context, index) {
                        final result = state.results[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              result['image'],
                            ),
                          ),
                          title: Text(result['name']),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}





//                else if (query == result[index]) {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return const NotFound();
//                 }));
//               } else if (state is SearchHistory) {
//                 return Column(
//                   children: [
//                     const Text(
//                       'History',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14,
//                       ),
//                     ),
//                     SizedBox(
//                       height: null,
//                       child: Column(
//                           children:
//                               List.generate(state.history.length, (index) {
//                         final query = state.history[index];
//                         return Column(
//                           children: [
//                             ListTile(
//                               title: Text(query),
//                               onTap: () {
//                                 _searchController.text = query;
//                                 context.read<SearchCubit>().search(query);
//                               },
//                               trailing: IconButton(
//                                   onPressed: () {
//                                     removeFromSearchHistory(query);
//                                   },
//                                   icon: const Icon(Icons.clear)),
//                             ),
//                             const Divider(),
//                           ],
//                         );
//                       })),
//                     )
//                   ],
//                 );
//               }
              
// }
              //return Container();
            //}
            //))
            // const Text(
            //   'History',
            //   style: TextStyle(
            //     fontWeight: FontWeight.w500,
            //     fontSize: 14,
            //   ),
            // ),
            // SizedBox(
            //   height: null,
            //   child: Column(
            //   children: List.generate(searchHistory.length, (index) {
            //     final query = searchHistory[index];
            //     return Column(
            //       children: [
            //         ListTile(
            //           title: Text(query),
            //           onTap: () {
            //             _searchController.text = query;

            //             addToSearchHistory(query);
            //           },
            //           trailing: IconButton(
            //               onPressed: () {
            //                 removeFromSearchHistory(query);
            //               },
            //               icon: const Icon(Icons.clear)),
            //         ),
            //         const Divider(),
            //       ],
            //     );
            //   })),
            // )
            // ListView.builder(
            //       itemCount: state.history.length,
            //       itemBuilder: (context, index) {
            //         final query = state.history[index];
            //         return ListTile(
            //           title: Text(query),
            //           onTap: () {
            //             _searchController.text = query;
            //             context.read<SearchCubit>().search(query);
            //           },
            //         );
            //       },
            //     );


          //],
        //),
      //);
  //}
//}
