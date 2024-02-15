import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/user_details.dart';

class UserController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<UserData?> userData = UserData(
          success: false,
          data: Data(
              userId: 0,
              name: '',
              email: '',
              mobile: '',
              dob: DateTime.now(),
              occupation: ''))
      .obs;

  Future<void> getUserDetails(int userId) async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse(
            'https://backend-gilt-two.vercel.app/api/v1/getMentees/$userId'),
      );
      print('user id in user controller $userId');
      if (response.statusCode == 200) {
        final Map<String, dynamic> userMap = json.decode(response.body);
        UserData user = userDataFromJson(json.encode(userMap));
        userData.value = user;
      } else {
        // Handle error
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      // Handle exception
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
