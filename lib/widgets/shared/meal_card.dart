import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookhaina_directory/pages/meal.dart';
import 'package:flutter/material.dart';

class MealCard extends StatefulWidget {
  final Map<String, dynamic> meal;

  const MealCard({super.key, required this.meal});

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  void onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Meal(
          mealId: widget.meal['idMeal'],
          mealName: widget.meal['strMeal'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: widget.meal['strMealThumb'],
        imageBuilder: (
          BuildContext context,
          ImageProvider<Object> imageProvider,
        ) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${widget.meal['strMeal']}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
