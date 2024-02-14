import 'package:get/get.dart';

import '../services/signup_auth.dart';

class SignUpController extends GetxController {
  final signupAuth = SignupAuth();
  signUpPressed(String name, String email, String number, String gender,
      String password, String dob, String occupation, String address) async {
    return await signupAuth.signUp(
        name, email, number, gender, password, dob, occupation, address);
  }
}
