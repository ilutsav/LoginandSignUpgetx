import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_getxwith_postapi/controller/shared_prefrences.dart';
import 'package:login_signup_getxwith_postapi/controller/user_controller.dart';
import 'package:login_signup_getxwith_postapi/services/login_auth.dart';

class HomeController extends GetxController {
  final UserController userController = Get.put(UserController());
  final LoginAuth loginAuth = Get.put(LoginAuth());
  final preferences = Get.put(PrefrencesManager());
  @override
  void onInit() async {
    super.onInit();
    int? userId = await preferences.getuserId();
    print(userId);
    if (userId != null) {
      userController.getUserDetails(userId);
    } else {
      // Handle the case where userId is null
    }
  }
}
