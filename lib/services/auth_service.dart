import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<bool> login(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('loggedInUser', username);
    return true;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedInUser');
  }

  static Future<String?> getLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('loggedInUser');
  }
}
