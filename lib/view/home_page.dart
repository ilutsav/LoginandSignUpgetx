import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_getxwith_postapi/controller/shared_prefrences.dart';
import 'package:login_signup_getxwith_postapi/view/login_page.dart';

class HomePage extends StatelessWidget {
  final prefrences = Get.put(PrefrencesManager());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello User,',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print('pressed');
                        prefrences.clearAuthToken();
                        Get.to(() => LoginPage());
                      },
                      child: Text('log out')),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
