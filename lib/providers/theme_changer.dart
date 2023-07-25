import 'package:flutter/material.dart';
import '../helper/helper_function.dart';

class ThemeChanger extends ChangeNotifier {
  String _themeMode = 'Light';

  String get getTheme {
    getThemeModeFromSF();
    return _themeMode;
  }

  getThemeModeFromSF() async {
    await HelperFunction.getThemeMode().then((value) {
      if (value != null) {
        _themeMode = value;
      }
    });
  }

  void setTheme(String theme) async {
    await HelperFunction.saveThemeMode(theme);
    _themeMode = theme;
    notifyListeners();
  }
}
