import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunshine/DataAndHttp/celcius.dart';
import 'package:sunshine/mainPage.dart';

class Temperature extends StatefulWidget {
  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  final String setC = "inCelcius";
  final String setN = "showNotifi";
  final String setT = "temp";
  bool inCelcius = false;
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    final myc = context.watch<Myc>();
    change() {
      myc.increment();
    }

    bool checkBoxValue = false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Units",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.grey[900],
            )),
        elevation: 0,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white70,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white70
              : Colors.grey[900],
          tooltip: 'Menu Icon',
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MainPage()));
          },
        ),
      ),
      body: Container(
          child: Column(children: [
        ListTile(
            contentPadding: EdgeInsets.only(left: 15, right: 0),
            title: Text("Temperature Units"),
            subtitle: myc.inCelcius ? Text("Celcius") : Text("FFFFF"),
            trailing: myc.inCelcius ? Text("C") : Text("F"),
            onTap: () {
              myc.increment();
            }),
      ])),
    );
  }

  loadFromPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
    inCelcius = prefs.getBool(setC) ?? false;
    return inCelcius;
  }

  savetoprefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
      prefs.setBool(setT, inCelcius);
    }
  }
}
