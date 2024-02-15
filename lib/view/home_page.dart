import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_getxwith_postapi/controller/shared_prefrences.dart';
import 'package:login_signup_getxwith_postapi/view/login_page.dart';
import '../controller/home_controller.dart';
import '../services/login_auth.dart';

class HomePage extends StatelessWidget {
  final prefrences = Get.put(PrefrencesManager());
  final loginAuth = Get.put(LoginAuth());
  final HomeController homeController = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      final userdata = homeController.userController.userData.value;
      return SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userdata?.data.name}',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      userdata?.data.occupation ?? '',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  print('pressed');
                  prefrences.clearAuthToken();
                  prefrences.clearuserId();
                  Get.to(() => LoginPage());
                },
                child: Text('log out')),
          ],
        ),
      )));
    }));
  }
}
