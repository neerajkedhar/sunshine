import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myc extends ChangeNotifier {
  // int _counter;
  late bool _inCelcius = false;
  late bool _showNotifi = true;
  //int get counter => _counter;
  bool get inCelcius => _inCelcius;
  bool get showNotifi => _showNotifi;
  final String setC = "inCelcius";
  final String setN = "showNotifi";
  late SharedPreferences prefs;

  Myc(this._inCelcius, this._showNotifi) {
    //  _inCelcius = false;
    //  _showNotifi = true;
    loadFromPrefs();
  }

  void increment() {
    _inCelcius = !_inCelcius;
    saveToPrefs();
    notifyListeners();
    print("someting someting $_inCelcius");
  }

  void toggleNotifi() {
    _showNotifi = !_showNotifi;
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  loadFromPrefs() async {
    await _initPrefs();
    _inCelcius = prefs.getBool(setC) ?? false;
    _showNotifi = prefs.getBool(setN) ?? true;
    print('_incelcius from prefs: ' + _inCelcius.toString());
    notifyListeners();
  }

  saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(setC, _inCelcius);
    prefs.setBool(setN, _showNotifi);
  }
}
