import 'package:get/get.dart';

import '../services/login_auth.dart';

class LoginController extends GetxController {
  final loginAuth = LoginAuth();
  RxBool rememberMe = false.obs;
  RxBool obscurePassword = true.obs;
  loginPressed(String email, String password) async {
    return await loginAuth.loginAuth(email, password);
  }

  void togglePasswordVisibility() {
    obscurePassword.toggle();
  }

  void togglerememberMe() {
    rememberMe.toggle();
  }
}
