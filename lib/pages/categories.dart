import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// App imports
import 'package:cookhaina_directory/widgets/categories/category_card.dart';
import 'package:cookhaina_directory/services/shared/query_client.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late final QueryClient _queryClient;
  late final Future<Map<String, dynamic>> _categoriesQuery;

  @override
  void initState() {
    super.initState();
    _queryClient = QueryClient();
    _categoriesQuery = _queryClient.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _categoriesQuery,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final List<dynamic> categories = snapshot.data['data']['categories'];

          return GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (BuildContext context, int index) {
              return CategoryCard(category: categories[index]);
            },
          );
        } else {
          final skeletonList = List.generate(20, (index) => index);
          return Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey[100]!,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: skeletonList.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
