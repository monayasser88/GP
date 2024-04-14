import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gp_project/components/custom_appbar.dart';
import 'package:gp_project/constraints.dart';
import 'package:gp_project/cubit/search_cubit.dart';
import 'package:gp_project/pages/account.dart';
import 'package:gp_project/pages/not_found.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  List<String> searchHistory = [];
  List<String> result = ['mona', 'fatma', 'manar', 'hadeer', 'soad', 'loool'];

  void addToSearchHistory(String query) {
    setState(() {
      searchHistory.insert(0, query);
    });
  }

  void removeFromSearchHistory(String query) {
    setState(() {
      searchHistory.remove(query);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
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
                TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _searchController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      floatingLabelStyle: const TextStyle(color: kPrimaryColor),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: kPrimaryColor,
                        ),
                        onPressed: () async {
                          final keyword = _searchController.text;
                          print('Search keyword submitted: $keyword');
                          addToSearchHistory(keyword);
                          if (keyword.isNotEmpty) {
                            await context.read<SearchCubit>().search(keyword);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotFound()),
                            );
                          }
                        },
                      ),
                      hintText: 'search',
                      label: const Text(
                        'Search',
                        style: TextStyle(fontSize: 18),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    if (pattern.isEmpty) {
                      return [];
                    }
                    final results =
                        await context.read<SearchCubit>().search(pattern);
                    if (results != null) {
                      return results
                          .map((result) => result['name'] as String)
                          .toList();
                    } else {
                      return [];
                    }
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.toString()),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _searchController.text = suggestion.toString();
                    addToSearchHistory(suggestion.toString());
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'History',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 600, // Set a fixed height or adjust as needed
                  child: ListView.builder(
                    itemCount: searchHistory.length,
                    itemBuilder: (context, index) {
                      final query = searchHistory[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(query),
                            onTap: () {
                              _searchController.text = query;
                              addToSearchHistory(query);
                            },
                            trailing: IconButton(
                              onPressed: () {
                                removeFromSearchHistory(query);
                              },
                              icon: const Icon(Icons.clear),
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
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
