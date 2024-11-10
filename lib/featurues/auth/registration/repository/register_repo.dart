import 'package:dio/dio.dart';
import 'package:hackathon_app/featurues/auth/log_in/repository/auth.dart';

class RegistrationRepo {
  static Future<String> register(Map<String, dynamic> postData) async {
    print(postData);
    try {
      final dio = Dio();
      final response = await dio.post(
        'http://localhost/account/register',
        data: {
          "users": {
            "weight": postData['weight'], 
            "height": postData['height']
          },
          "data": {
            "username": postData['username'],
            "password": postData['password'],
            "birth_date": postData['birth_date']
          }
        },
      );
      AuthRepo.logIn(postData);
      if (response.statusCode == 200) {
        return 'success';
      } else {
        return response.data['message'];
      }
    } catch (e) {
      return e.hashCode.toString();
    }
  }
}
