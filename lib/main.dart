import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_getxwith_postapi/view/login_page.dart';
import 'controller/shared_prefrences.dart';
import 'view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: PrefrencesManager().getAuthToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: CircularProgressIndicator());
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            return GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomePage(),
            );
          } else {
            // If the token is not available, navigate to the login page
            return GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: LoginPage(),
            );
          }
        }
      },
    );
  }
}
