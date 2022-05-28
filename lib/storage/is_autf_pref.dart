import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _Key {
  static const String key = 'isAuth';
}

class IsAuthPrefProvider {
  final _pref = SharedPreferences.getInstance();
  Future<void> setIsAuth({required bool isAuth}) async {
    final preferences = await _pref;
    preferences.setBool(_Key.key, isAuth);
    print(isAuth);
  }

  Future<bool?> getIsAuth() async {
    final preferences = await _pref;
    final isAuth = preferences.getBool(_Key.key);
    print(isAuth);
  }

  Future<void> deleteAuth() async {
    var preferences = await _pref;
    preferences.setBool(_Key.key, false);
  }
}
