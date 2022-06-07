import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/models/user.dart';

class AuthService {
  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    final success = Random().nextBool();

    if (success) {
      final user = User(
          email: email,
          authToken: 'fgedhjfdefgdsyhedet65r36783yhgedrtefdgedtyredfteg');

      //save user data
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', json.encode(user.toJson()));

      return user;
    } else {
      throw 'Invalid email or password';
    }
  }

  Future<User?> getLoggedinUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson == null) {
      return null;
    }
    return User.fromJson(json.decode(userJson));
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
  }
}
