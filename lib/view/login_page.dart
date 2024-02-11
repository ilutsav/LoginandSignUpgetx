import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_getxwith_postapi/controller/login_controller.dart';

import 'home_page.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});
  final primaryColor = const Color(0xFF8B4CFC);
  bool rememberMe = false;
  final loginController = Get.put(LoginController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Icon(Icons.arrow_back),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Text(
                        "Skip",
                        style: TextStyle(fontSize: 14),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: 18),
              const Text(
                'What’s your email',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 30),
              TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'email',
                    suffixIcon: Icon(
                      Icons.mail,
                      color: primaryColor,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: primaryColor,
                        )),
                  )),
              const SizedBox(height: 12),
              TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password',
                    suffixIcon: const Icon(
                      Icons.mail,
                      color: Color(0xFF8B4CFC),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xFF8B4CFC),
                        )),
                  )),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all(primaryColor),
                        value: rememberMe,
                        onChanged: (value) {},
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'forgot password?',
                        style: TextStyle(
                            color: primaryColor,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () async {
                  bool sucess = await loginController.loginPressed(
                      emailController.text, passwordController.text);
                  if (sucess) {
                    Get.to(() => HomePage());
                  } else {
                    Get.snackbar(
                      'Error',
                      'Login Failed',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(SignUp());
                    },
                    child: const Text(
                      'Create new account',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
