import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  bool _notifications = true;
  bool _isFirstTimeUser = false;
  bool _darkMode = false;
  Color _color = Colors.blue.shade400;

  bool get notifications => _notifications;
  bool get isFirstTimeUser => _isFirstTimeUser;
  bool get darkMode => _darkMode;
  Color get color => _color;

  SettingProvider() {
    _load();
  }

  void _load() async {
    final prefs = await SharedPreferences.getInstance();
    final showOnboarding = prefs.getBool('showOnboarding') ?? true;
    _isFirstTimeUser = showOnboarding;
  }

  void toogleNotifications(bool value) {
    _notifications = value;
    notifyListeners();
  }

  void toogleGuideHome(bool value) async {
    _isFirstTimeUser = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showOnboarding', value);
    notifyListeners();
  }

  void toogleDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }

  void toogleColors(Color color) {
    _color = color;
    notifyListeners();
  }
}
