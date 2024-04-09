import 'package:flutter/material.dart';

// App imports
import 'package:cookhaina_directory/services/shared/query_client.dart';
import 'package:cookhaina_directory/widgets/shared/divider_with_text.dart';
import 'package:cookhaina_directory/widgets/shared/meal_grid_builder.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  late final QueryClient _queryClient;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _queryClient = QueryClient();
  }

  @override
  Widget build(BuildContext context) {
    void onSearch() {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }

      setState(() {
        searchQuery = searchController.text;
      });
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    hintText: "Search by meal name or main ingredient",
                    fillColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: onSearch,
                icon: const Icon(Icons.search_rounded),
              ),
            ],
          ),
        ),
        Builder(
          builder: (BuildContext context) {
            if (searchQuery.isNotEmpty) {
              return Expanded(
                child: ListView(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                        child: const DividerWithText(
                            label: "Search results by meal name")),
                    MealGridBuilder(
                      getMealFn: () =>
                          _queryClient.getMealsByName(mealName: searchQuery),
                      key: ValueKey("MealGridBuilderByMealName-$searchQuery"),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 35, 0, 15),
                        child: const DividerWithText(
                            label: "Search results by main ingredient")),
                    MealGridBuilder(
                      getMealFn: () => _queryClient.getMealsByMainIngredient(
                          mainIngredient: searchQuery),
                      key: ValueKey(
                          "MealGridBuilderByMainIngredient-$searchQuery"),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.only(top: 50),
                child: Opacity(
                  opacity: 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Theme.of(context).colorScheme.primary
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.search_rounded,
                              size: 50,
                              weight: 2,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        'Find meals \nby name \nor ingredient',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
