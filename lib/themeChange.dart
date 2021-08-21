import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Color lightColor = Color(returnMainPageColor(_darkTheme));
//Color darkColor = Color(returnMainPageColor(_darkTheme));
ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.blueAccent,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Aileron',
);

const darkColor = const Color(0x282c39);

ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    accentColor: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[900],
    fontFamily: 'Aileron',
    textTheme: TextTheme(
      body1: TextStyle(color: Colors.white),
      subtitle: TextStyle(color: Color(0xFFFEBEBEB)),
    ));

class ThemeChanger with ChangeNotifier {
  late bool _darkTheme;

  final String key = "theme";

  late SharedPreferences prefs;
  bool get darkTheme => _darkTheme;
  bool get darkThemeWidgets => _darkTheme;

  ThemeChanger() {
    _darkTheme = false;

    loadFromPrefs();
  }
  toggleTheme() {
    _darkTheme = !_darkTheme;
    saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? false;

    print('_darktheme from prefs: ' + _darkTheme.toString());

    notifyListeners();
  }

  saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, _darkTheme);
  }

  notifyListeners();
}
