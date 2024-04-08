List<String> extractIngredients(Map<String, dynamic> meal) {
  List<String> keyList = meal.keys.toList();
  List<String> ingredientKeys = keyList.where((key) => key.contains('strIngredient')).toList();
  List<String> measureKeys = keyList.where((key) => key.contains('strMeasure')).toList();
  List<String> ingredientWithMeasureList = [];
  
  for (int i = 0; i < ingredientKeys.length; i++) {
    String? ingredient = meal[ingredientKeys[i]];
    String? measure = meal[measureKeys[i]];    

    if ((ingredient != null) && (measure != null)) {
      if (ingredient.isNotEmpty && measure.isNotEmpty) {
        ingredientWithMeasureList.add("$measure $ingredient");
      }
    }
  }
  
  return ingredientWithMeasureList;
}