import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  late SharedPreferences sharedPreferences;
  ThemeMode _themeMode = ThemeMode.light;
  String _language = 'ar';

  ThemeMode get themeMode => _themeMode;
  String get language => _language;
  
  SettingsProvider() {
    _loadPreferences();
  }

  void changeTheme(ThemeMode selectedthememode) {
    _themeMode = selectedthememode;
    notifyListeners();
  }

  void changeLanguage(String lang) {
    _language = lang;
    notifyListeners();
  }

   void setMode (ThemeMode themeMode)async {
    _themeMode =themeMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', themeMode.index);
    notifyListeners();
   }

  void setLanguage(String language) async {
    _language= language;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    notifyListeners();
  }
  
  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = ThemeMode.values[prefs.getInt('themeMode') ?? 0];
    _language = prefs.getString('language') ?? 'ar';
    notifyListeners();
  }

}
