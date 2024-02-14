import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefrencesManager extends GetxController {
  RxString authToken = ''.obs;
  Future<void> saveToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', token ?? '');
  }

  Future<void> saveuserId(int? id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', id ?? 0);
  }

  Future<int?> getuserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId') ?? 0;
    return userId;
  }

  Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken.value = prefs.getString('authToken') ?? '';
    return authToken.value.isNotEmpty ? authToken.value : null;
  }

  Future<String?> clearAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken');
  }
}
