import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final Map<String, dynamic> category;
  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.category['strCategoryThumb'],
      imageBuilder: (
        BuildContext context,
        ImageProvider<Object> imageProvider,
      ) {
        return Container(
          height: 100,
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
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.category['strCategory'],
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
