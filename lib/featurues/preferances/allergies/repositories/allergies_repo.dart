import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IngredientsRepository {
  static Future<List<Map<String, dynamic>>> getIngredients() async {
    final dio = Dio();

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(milliseconds: 500));

    dio.options.headers['Authorization'] = 'Bearer ${prefs.getString("access")}';

    try {
      final response = await dio.get("http://localhost/diet/ingredients");
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      return [
        {
          "error": "Error fetching ingredients: ${e.hashCode}"
        }
      ];
    }
  }
}