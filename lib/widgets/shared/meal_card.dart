import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final Map<String, dynamic> meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: meal['strMealThumb'],
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
                  "${meal['strMeal']}",
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
    );
  }
}
