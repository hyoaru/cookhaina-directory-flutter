import 'dart:convert';
import 'package:http/http.dart' as http;

class QueryClient {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';
  late http.Client _client;

  QueryClient() {
    _client = http.Client();
  }

  Future<Map<String, dynamic>> _get(String endPoint) async {
    final url = Uri.parse('${QueryClient._baseUrl}/$endPoint');
    var response = await _client.get(url);

    if (response.statusCode == 200) {
      var jsonDecodedResponse = jsonDecode(response.body);
      return {
        "data": jsonDecodedResponse as Map<String, dynamic>,
        "error": null
      };
    } else {
      return {
        "data": null,
        "error": {
          "status_code": response.statusCode,
          "message": "Failed to fetch data."
        }
      };
    }
  }

  Future<Map<String, dynamic>> getRandomMeal() async {
    return await _get('/random.php');
  }

  Future<Map<String, dynamic>> getRandomMeals() async {
    Map<String, dynamic> response = await getRandomMeal();
    final String randomMealCategory = response['data']['meals'][0]['strCategory'];
    return await _get('/filter.php?c=$randomMealCategory');
  }

  Future<Map<String, dynamic>> getCategories() async {
    return await _get('/categories.php');
  }
}
