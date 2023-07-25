import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction{
  static String userLoggedInKey = 'LOGGEDINKEY';
  static String userNameKey = 'USERNAMEKEY';
  static String userEmailKey = 'USEREMAILKEY';
  static String themeMode = 'Light';

  static Future<bool?> getUserLoggedInState() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }
  static Future<String?> getUserNameSF() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
  static Future<String?> getUserEmailSF() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }
  static Future<String?> getThemeMode() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(themeMode);
  }
  static Future<bool?> saveUserLoginStatus(bool isLoggedIn) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(userLoggedInKey, isLoggedIn);
  }
  static Future<bool?> saveUserNameSF(String name) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userNameKey, name);
  }
  static Future<bool?> saveUserEmailSF(String email) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(userEmailKey, email);
  }
  static Future<bool?> saveThemeMode(String mode) async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setString(themeMode, mode);
  }
}
