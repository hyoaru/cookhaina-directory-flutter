import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  final String ingredient;
  final int index;

  const IngredientTile({
    super.key,
    required this.ingredient,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        // border: Border.all(width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.3)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                child: Text(
                  "$index",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 12),
                ),
              ),
            ),
            Expanded(
              child: Text(ingredient),
            ),
          ],
        ),
      ),
    );
  }
}
