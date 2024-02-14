import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup_getxwith_postapi/controller/shared_prefrences.dart';

class LoginAuth {
  final prefrencesController = Get.put(PrefrencesManager());
  String? token;
  int? userId;
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
        token = json.decode(response.body)['token'];
        userId = json.decode(response.body)['userId'];
        print('login sucessful');
        print(response.body);
        prefrencesController.saveToken(token);
        print('token = $token');

        getUserDetails();
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

  Future<Map<String, dynamic>?> getUserDetails() async {
    if (userId == null) {
      print('Error: No userId available');
      return null;
    }

    try {
      final response = await http.get(
        Uri.parse(
          'https://backend-gilt-two.vercel.app/api/v1/getMentees/$userId',
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> userData = json.decode(response.body);
        print('User details fetched successfully');
        print('user data $userData');
        return userData;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
