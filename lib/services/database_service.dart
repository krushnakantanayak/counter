import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  static Future<int> getUserCounter(String username) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(username) ?? 0;
  }

  static Future<void> updateUserCounter(String username, int counter) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(username, counter);
  }
}
