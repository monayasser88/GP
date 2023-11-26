import 'package:flutter/material.dart';
import 'package:gp_project/components/custom_appbar.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  List<String> searchHistory = [];

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
  Widget build(BuildContext context) {
    return Padding(
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
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  final query = _searchController.text;

                  addToSearchHistory(query);
                },
              ),
              hintText: 'search',
              label: const Text(
                'Search',
                style: TextStyle(fontSize: 18),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey, width: 1)),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'History',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: null,
            child: Column(
                children: List.generate(searchHistory.length, (index) {
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
                        icon: const Icon(Icons.clear)),
                  ),
                  const Divider(),
                ],
              );
            })),
          )
        ],
      ),
    );
  }
}
