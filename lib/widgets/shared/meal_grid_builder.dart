import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// App imports
import 'package:cookhaina_directory/widgets/shared/meal_card.dart';

class MealGridBuilder extends StatefulWidget {
  final Future<Map<String, dynamic>> Function() getMealFn;
  const MealGridBuilder({super.key, required this.getMealFn});

  @override
  State<MealGridBuilder> createState() => _MealGridBuilderState();
}

class _MealGridBuilderState extends State<MealGridBuilder>
    with AutomaticKeepAliveClientMixin {
  late final Future<Map<String, dynamic>> _mealQuery;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _mealQuery = widget.getMealFn();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _mealQuery,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final List<dynamic>? randomMeals = snapshot.data['data']['meals'];
          if (randomMeals != null) {
            return GridView.builder(
              shrinkWrap: true,
              itemCount: randomMeals.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return MealCard(meal: randomMeals[index]);
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
                      child: Icon(Icons.highlight_remove_rounded, size: 40,),
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
        } else {
          return const _MealGridBuilderSkeleton();
        }
      },
    );
  }
}

class _MealGridBuilderSkeleton extends StatelessWidget {
  const _MealGridBuilderSkeleton();

  @override
  Widget build(BuildContext context) {
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
}
