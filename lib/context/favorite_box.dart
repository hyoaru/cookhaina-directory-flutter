import 'package:hive_flutter/hive_flutter.dart';

class FavoriteBox {
  static const String _boxName = 'favorites';
  late final Box<dynamic> _box;

  FavoriteBox() {
    _box = Hive.box(_boxName);
  }

  Map<String, dynamic> add({
    required String mealId,
    required Map<String, dynamic> meal,
  }) {
    Map<String, dynamic> response = {
      "data": null,
      "error": null,
    };

    bool mealAlreadyExists = (_box.get(mealId) != null ? true : false);

    if (!mealAlreadyExists) {
      _box.put(mealId, meal);
      response['data'] = meal;
    } else {
      response['error'] = "Already has in favorites.";
    }

    return response;
  }

  Map<String, dynamic> get({
    required String mealId,
  }) {
    Map<String, dynamic> response = {
      "data": _box.get(mealId),
      "error": null,
    };

    return response;
  }

  Map<String, dynamic> delete({
    required String mealId,
  }) {
    Map<String, dynamic> response = {
      "data": _box.delete(mealId),
      "error": null,
    };

    return response;
  }

  List<Map<String, dynamic>> getAll() {
    List<Map<String, dynamic>> favorites = _box.values
        .map((favorite) => {
              "strMeal": favorite['strMeal'],
              "strMealThumb": favorite['strMealThumb'],
              "idMeal": favorite['idMeal'],
            })
        .toList();

    return favorites;
  }
}
