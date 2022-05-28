import '../storage/id_user_preferences.dart';
import '../storage/is_autf_pref.dart';

class MyAppModal {
  bool IsAuth = true;
  var userId = 1;

  Future<void> getIsAuthFunction() async {
    var IsAuthF = await IsAuthPrefProvider().getIsAuth();
    bool auth;
    if (IsAuthF != null) {
      auth = IsAuthF;
      print(auth);
    }
  }

  Future<void> detUserId() async {
    var userIdPref = await UserIdPrefProvider().getUserId();
    if (userIdPref != null) {
      userId = userIdPref;
    }
  }
}
