import 'package:get/get.dart';

import '../services/login_auth.dart';

class LoginController extends GetxController {
  final loginAuth = LoginAuth();
  bool rememberMe = false;
  loginPressed(String email, String password) async {
    return await loginAuth.loginAuth(email, password);
  }
}
