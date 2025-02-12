import 'package:counter/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<UserModel?> getUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt(username) ?? 0;
    return UserModel(username: username, counter: counter);
  }

  Future<List<UserModel>> getAllUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    return keys
        .map((key) => UserModel(username: key, counter: prefs.getInt(key) ?? 0))
        .toList();
  }

  Future<void> createUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(user.username, user.counter);
  }

  Future<void> updateUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(user.username, user.counter);
  }

  Future<void> deleteUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(username);
  }
}
