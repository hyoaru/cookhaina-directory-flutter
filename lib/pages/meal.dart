import 'package:flutter/material.dart';

// App imports
import 'package:cookhaina_directory/services/shared/query_client.dart';
import 'package:cookhaina_directory/utils/meal/extract_ingredients.dart';
import 'package:cookhaina_directory/widgets/meal/ingredient_tile.dart';
import 'package:cookhaina_directory/widgets/base/layout.dart';
import 'package:cookhaina_directory/widgets/meal/instruction_tile.dart';
import 'package:cookhaina_directory/widgets/meal/meal_image.dart';
import 'package:cookhaina_directory/widgets/shared/pill.dart';
import 'package:shimmer/shimmer.dart';

class Meal extends StatefulWidget {
  final String mealId;
  final String mealName;
  const Meal({super.key, required this.mealId, required this.mealName});

  @override
  State<Meal> createState() => _MealState();
}

class _MealState extends State<Meal> {
  late final QueryClient _queryClient;
  late final Future<Map<String, dynamic>> _mealQuery;

  @override
  void initState() {
    super.initState();
    _queryClient = QueryClient();
    _mealQuery = _queryClient.getMeal(mealId: widget.mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        scrolledUnderElevation: 0,
        title: Text(
          widget.mealName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.favorite_rounded),
      ),
      body: Layout(
        child: FutureBuilder(
          future: _mealQuery,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final Map<String, dynamic> meal =
                  snapshot.data['data']['meals'][0];
              final List<String> ingredientWithMeasureList =
                  extractIngredients(meal);
              final List<String>? instructionList =
                  meal['strInstructions']?.split('\r\n');
              final List<String>? tagList = meal['strTags']?.split(',');

              return ListView(
                children: [
                  MealImage(meal: meal),
                  Text(
                    meal['strMeal'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  Builder(builder: (BuildContext context) {
                    if (tagList != null) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            ...tagList.map(
                              (tag) => Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: Pill(text: tag),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                    child: const Text(
                      'Instructions:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: instructionList?.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      if (instructionList != null) {
                        final String instruction = instructionList[index];
                        if (instruction.isNotEmpty) {
                          return InstructionTile(instruction: instruction);
                        }
                      }

                      return Container();
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                    child: const Text(
                      'Ingredients:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ingredientWithMeasureList.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return IngredientTile(
                        ingredient: ingredientWithMeasureList[index],
                        index: index,
                      );
                    },
                  )
                ],
              );
            } else {
              return Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[100]!,
                child: ListView(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 25, 0, 5),
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 25, 0, 5),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      height: 80,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 25, 0, 5),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      height: 80,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
