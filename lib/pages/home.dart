import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// App imports
import 'package:cookhaina_directory/services/shared/query_client.dart';
import 'package:cookhaina_directory/widgets/home/random_meal_card.dart';
import 'package:cookhaina_directory/widgets/shared/divider_with_text.dart';
import 'package:cookhaina_directory/widgets/shared/meal_grid_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _queryClient = QueryClient();


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const RandomMealCard(),
        const DividerWithText(
          label: 'Discover new recipes',
          verticalMargin: 15,
        ),
        
        MealGridBuilder(getMealFn: _queryClient.getRandomMeals)
      ],
    );
  }
}
