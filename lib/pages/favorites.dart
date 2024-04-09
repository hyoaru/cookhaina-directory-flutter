import 'package:cookhaina_directory/context/favorite_box.dart';
import 'package:cookhaina_directory/widgets/shared/meal_card.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteBox favoriteBox = FavoriteBox();
    List<Map<String, dynamic>> favorites = favoriteBox.getAll();

    return ListView(
      children: [
        Builder(
          builder: (BuildContext context) {
            if (favorites.isNotEmpty) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: favorites.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MealCard(meal: favorites[index]);
                },
              );
            } else {
              return const Opacity(
                opacity: 0.3,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.highlight_remove_rounded,
                          size: 40,
                        ),
                      ),
                      Text(
                        'No meals found.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
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
