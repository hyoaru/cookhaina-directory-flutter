import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MealImage extends StatelessWidget {
  final Map<String, dynamic> meal;
  const MealImage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: meal['strMealThumb'],
      imageBuilder: (
        BuildContext context,
        ImageProvider<Object> imageProvider,
      ) {
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.grey[200]!,
                BlendMode.multiply,
              ),
            ),
          ),
        );
      },
    );
  }
}
