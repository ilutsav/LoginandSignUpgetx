import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginAuth {
  Future<bool> loginAuth(String email, String password) async {
    final Map<String, dynamic> requestbody = {
      'email': email,
      'password': password,
    };
    try {
      final response = await http.post(
          Uri.parse('https://backend-gilt-two.vercel.app/api/v1/login'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(requestbody));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        String token = json.decode(response.body)['token'];
        print('login sucessful');
        print('token = $token');
        return true;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
