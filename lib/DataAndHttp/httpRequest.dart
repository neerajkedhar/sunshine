import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:geocoder/geocoder.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:sunshine/homeScreen.dart';

class HttpRequest with ChangeNotifier {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var weatherIcon;
  var maxTemp;
  var minTemp;
  var pressure;
  var visibility;
  var uvindex;
  var clouds;
  var dewPoint;
  var main;
  var mainTempInC;
  var nextDayMin;
  var nextDayMax;
  var nextDayMinC;
  var nextDayMaxC;
  var nextDayDescription;
  //var aqi;
  var co;
  var no;
  var no2;
  var o3;
  var so2;
  var aqii;
  bool inCelcius = false;
  Map? results;
  Map? daily;
  // ignore: deprecated_member_use
  List? hourlyTemp = [];
  List? hourlyTempInC = [];
  List<String>? hourlyDescription = [];
  List? hourlyTime = [];
  List? dailyTemp = [];
  List? dailyTempInC = [];
  List<String>? dailyDescription = [];
  List? dailyTime = [];
  var lati;
  var longi;
  var geolocator;
  final String setC = "inCelciuss";
  var currentPosition;
  // bool _inCelcius = false;
  String? area;
  SharedPreferences? prefs;
  var first;
  void increment() {
    inCelcius = !inCelcius;
    saveToPrefs();
    notifyListeners();
    print("someting someting $inCelcius");
  }

  _initPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  loadFromPrefs() async {
    await _initPrefs();
    inCelcius = prefs!.getBool(setC) ?? false;

    print('_incelcius from prefs: ' + inCelcius.toString());
    notifyListeners();
  }

  saveToPrefs() async {
    await _initPrefs();
    prefs!.setBool(setC, inCelcius);
  }

  searchAreaName(var currentPosition) async {
    try {
      final coordinates =
          new Coordinates(currentPosition.latitude, currentPosition.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      first = addresses.first;

      print("printing first ;  ${first.locality}");
      //  addressLane = "${first.locality}";
      //  printingAddress = addressLane.toString();
    } catch (e) {
      print("error: $e");
    }
  }

  var pos;
  getCurrentLocationn() async {
    //  var result = await permissionHandler.requestPermissions([permission]);
    bool serviceEnabled;
    LocationPermission permission;

    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      geolocator = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.medium)
          .then((Position position) {
        pos = position;
      });
      // Use location.
    } else {
      var stst = await Permission.location.request();
      if (stst.isGranted) {
        geolocator = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.medium)
            .then((Position position) {
          pos = position;
        });
        lati = pos.latitude.toStringAsFixed(7);
        longi = pos.longitude.toStringAsFixed(7);
        // getTemp(lati, longi);
        print("latitude royyy" + lati);
        print("longitude royyy" + longi);
        fetchingData(lati, longi);
      }
    }

    lati = pos.latitude.toStringAsFixed(7);
    longi = pos.longitude.toStringAsFixed(7);
    // getTemp(lati, longi);
    print("latitude royyy" + lati);
    print("longitude royyy" + longi);
    fetchingData(lati, longi);
  }

  fetchingData(var lati, var longi) async {
    //getCurrentLocationn();
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lati&lon=$longi&exclude=minutely&units=imperial&appid=6bd162a923aae207652268d7cbc4bb4c');
    http.Response aqi = await http.get(
        'https://api.openweathermap.org/data/2.5/air_pollution?lat=$lati&lon=$longi&appid=6bd162a923aae207652268d7cbc4bb4c');
    var aqiResults = jsonDecode(aqi.body);
    print("jason dataaaa $aqiResults");
    results = jsonDecode(response.body);
    print("from the loop");
    aqii = aqiResults['list'][0]['main']['aqi'];
    print("aqi $aqii");

    co = aqiResults['list'][0]['components']['co'];
    no = aqiResults['list'][0]['components']['no'];
    no2 = aqiResults['list'][0]['components']['no2'];
    o3 = aqiResults['list'][0]['components']['o3'];
    so2 = aqiResults['list'][0]['components']['so2'];

    print("co $co");
    description = results!['current']['weather'][0]['description'];
    temp = results!['current']['temp'];
    visibility = results!['current']['visibility'] / 1000;
    uvindex = results!['current']['uvi'];
    humidity = results!['current']['humidity'];
    windSpeed = results!['current']['wind_speed'];
    pressure = results!['current']['pressure'];
    clouds = results!['current']['clouds'];
    dewPoint = results!['current']['dew_point'];
    main = results!['current']['weather'][0]['main'].toString();
    nextDayMin = results!['daily'][1]['temp']['min'];
    nextDayMax = results!['daily'][1]['temp']['max'];
    nextDayMinC = ((results!['daily'][1]['temp']['min'] - 32) * 5 / 9);
    nextDayMaxC = ((results!['daily'][1]['temp']['max'] - 32) * 5 / 9);
    nextDayDescription = results!['daily'][1]['weather'][0]['description'];
    print(results!['current'].length);
    print("this issss: " + nextDayMin.toString());
    mainTempInC = ((temp - 32) * 5 / 9);

    hourlyTemp?.clear();
    hourlyTime?.clear();
    hourlyDescription?.clear();
    dailyTempInC?.clear();
    hourlyTempInC?.clear();
    searchAreaName(pos);
    try {
      final coordinates = new Coordinates(pos.latitude, pos.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      first = addresses.first;

      print("printing first ;  ${first.locality}");
      //  addressLane = "${first.locality}";
      //  printingAddress = addressLane.toString();
    } catch (e) {
      print("error: $e");
    }
    print("prinnnnn ${first.locality}");
    area = first.locality;
    notifyListeners();

    for (var i = 0; i < 48; i++) {
      hourlyTemp?.add(results!['hourly'][i]['temp'].toStringAsFixed(0));
      hourlyTime?.add(DateTime.fromMillisecondsSinceEpoch(
          results!['hourly'][i]['dt'] * 1000));
      hourlyDescription
          ?.add(results!['hourly'][i]['weather'][0]['main'].toString());
    }
    for (var i = 0; i < 7; i++) {
      dailyTemp?.add(results!['daily'][i]['temp']['day'].toStringAsFixed(0));
      dailyTime?.add(DateTime.fromMillisecondsSinceEpoch(
          results!['daily'][i]['dt'] * 1000));
      dailyDescription
          ?.add(results!['daily'][i]['weather'][0]['main'].toString());
    }

    for (var i = 0; i < 7; i++) {
      dailyTempInC?.add(((results!['daily'][i]['temp']['day'] - 32) * 5 / 9)
          .toStringAsFixed(0));
    }
    for (var i = 0; i < 25; i++) {
      hourlyTempInC?.add(
          ((results!['hourly'][i]['temp'] - 32) * 5 / 9).toStringAsFixed(0));
    }
    print(hourlyTempInC?[0]);
  }
}
