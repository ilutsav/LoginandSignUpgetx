import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup_getxwith_postapi/controller/shared_prefrences.dart';
import 'package:login_signup_getxwith_postapi/controller/user_controller.dart';
import 'package:login_signup_getxwith_postapi/models/user_details.dart';

class LoginAuth extends GetxController {
  final prefrencesController = Get.put(PrefrencesManager());
  final userController = Get.put(UserController());
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
        print('user id in login auth $userId');
        prefrencesController.saveuserId(userId);
        prefrencesController.saveToken(token);
        userController.getUserDetails(userId!);
        return true;
      } else {
        //print('Error: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      // print(e);
      return false;
    }
  }
}
