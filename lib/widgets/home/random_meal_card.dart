import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookhaina_directory/pages/meal.dart';
import 'package:flutter/material.dart';

// App imports
import 'package:cookhaina_directory/services/shared/query_client.dart';
import 'package:shimmer/shimmer.dart';

class RandomMealCard extends StatefulWidget {
  const RandomMealCard({super.key});

  @override
  State<RandomMealCard> createState() => _RandomMealCardState();
}

class _RandomMealCardState extends State<RandomMealCard>
    with AutomaticKeepAliveClientMixin {
  late final QueryClient _queryClient;
  late final Future<Map<String, dynamic>> _randomMealQuery;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _queryClient = QueryClient();
    _randomMealQuery = _queryClient.getRandomMeal();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    void onTap({required String mealId, required String mealName, required String mealThumbnail,}) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Meal(
            mealId: mealId,
            mealName: mealName,
            mealThumbnail: mealThumbnail,
          ),
        ),
      );
    }

    return FutureBuilder(
      future: _randomMealQuery,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final randomMeal = snapshot.data['data']['meals'][0];
          return GestureDetector(
            onTap: () => onTap(
              mealId: randomMeal['idMeal'],
              mealName: randomMeal['strMeal'],
              mealThumbnail: randomMeal['strMealThumb'],
            ),
            child: CachedNetworkImage(
                imageUrl: randomMeal['strMealThumb'],
                imageBuilder: (
                  BuildContext context,
                  ImageProvider<Object> imageProvider,
                ) {
                  return Container(
                    height: 180,
                    width: double.infinity,
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
                            "${randomMeal['strArea']}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "${randomMeal['strMeal']}",
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => const _RandomMealCardSkeleton()),
          );
        } else {
          return const _RandomMealCardSkeleton();
        }
      },
    );
  }
}

class _RandomMealCardSkeleton extends StatelessWidget {
  const _RandomMealCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
