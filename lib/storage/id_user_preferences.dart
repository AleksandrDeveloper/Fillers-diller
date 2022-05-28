import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _Key {
  static const String key = 'userId';
}

class UserIdPrefProvider {
  final _pref = SharedPreferences.getInstance();
  Future<void> setUserId({required int userId}) async {
    final preferences = await _pref;
    preferences.setInt(_Key.key, userId);
    print(userId);
  }

  Future<int?> getUserId() async {
    final preferences = await _pref;
    final userId = preferences.getInt(_Key.key);
    print(userId);
  }
}
