import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup_getxwith_postapi/controller/shared_prefrences.dart';

class SignupAuth {
  final preferences = Get.put(PrefrencesManager());
  Future<bool> signUp(String name, String email, String number, String gender,
      String password, String dob, String occupation, String address) async {
    final Map<String, dynamic> requestbody = {
      'name': name,
      'email': email,
      'number': number,
      'gender': gender,
      'password': password,
      'dob': dob,
      'occupation': occupation,
      'address': address
    };
    try {
      final response = await http.post(
          Uri.parse(
              'https://backend-gilt-two.vercel.app/api/v1/registerMentee'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(requestbody));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        String token = json.decode(response.body)['token'];
        preferences.saveToken(token);
        print('signup sucessful');
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
