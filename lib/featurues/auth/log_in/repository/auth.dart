import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static Future<bool> logIn(Map<String, dynamic> postData) async {
    try {
      final dio = Dio();
      
      final formData = FormData.fromMap({
        'username': postData['username'],
        'password': postData['password'], 
      });

      final response = await dio.post(
        'http://localhost/account/token',
        data: formData,
      );

      if (response.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString('access', response.data['access_token']);
        await prefs.setString('refresh', response.data['refresh_token']);
        await prefs.setString('username', postData['username']);
        await prefs.setString('password', postData['password']);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}


class Auth {
  static Future<List<String?>> getRA() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return [prefs.getString('access'), prefs.getString('refresh')];
  }
}
