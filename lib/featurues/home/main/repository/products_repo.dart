import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsRepo {
  static Future<List<Map<String, dynamic>>> getProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    
    dio.options.headers['Authorization'] = 'Bearer ${prefs.getString("access")}';

    try {
      final response = await dio.get("http://localhost/diet/products");
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      return [{
        "error": "Error fetching products: ${e.hashCode}"}];
    }
  }
}