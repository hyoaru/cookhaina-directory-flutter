import 'package:cookhaina_directory/services/shared/query_client.dart';
import 'package:cookhaina_directory/widgets/base/layout.dart';
import 'package:cookhaina_directory/widgets/shared/meal_grid_builder.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String categoryName;
  const Category({super.key, required this.categoryName});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late final QueryClient _queryClient;

  @override
  void initState() {
    super.initState();
    _queryClient = QueryClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        scrolledUnderElevation: 0,
        title: Text(
          widget.categoryName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Layout(
        child: ListView(
          children: [
            MealGridBuilder(getMealFn: () => _queryClient.getMealsByCategory(categoryName: widget.categoryName))
          ]
        ),
      ),
    );
  }
}
