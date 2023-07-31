import 'package:flutter/material.dart';
import '../helper/helper_function.dart';

class ThemeChanger extends ChangeNotifier {
  String themeMode = 'Light';

  String get getTheme {
    getThemeModeFromSF();
    return themeMode;
  }

  getThemeModeFromSF() async {
    await HelperFunction.getThemeMode().then((value) {
      if (value != null) {
        themeMode = value;
      }
    });
  }

  void setTheme(String theme) async {
    await HelperFunction.saveThemeMode(theme);
    themeMode = theme;
    notifyListeners();
  }
}
