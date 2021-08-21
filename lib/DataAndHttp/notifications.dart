import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:sunshine/AllWidgets/ads.dart';

import 'package:sunshine/homeScreen.dart';
import 'package:sunshine/main.dart';
import 'package:sunshine/mainPage.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  TimeOfDay _time = new TimeOfDay.now();
  late TimeOfDay picked;
  late SharedPreferences prefs;
  late SharedPreferences prefsb;
  final String setH = "NotifyHour";
  final String setM = "NotifyMin";
  final String setN = "showNotify";
  late bool _showNotifi;
  String time = TimeOfDay(hour: 7, minute: 0).toString();
  var maxi = max.toStringAsFixed(0);
  var mini = min.toStringAsFixed(0);
  String initialIn = initial;
  //var maxiC = maxC.toStringAsFixed(0);
  // var miniC = minC.toStringAsFixed(0);
  var deci = dec;
  late int hour;
  late int minute;
  var hourin12;
  var amorpm;
  var min00;
  var city = cityy;

  selectTime(BuildContext context) async {
    picked = (await showTimePicker(
      context: context,
      initialTime: _time,
    ))!;
    // amorpm = DateFormat.jm().format(picked.toString());
    setState(() {
      _time = picked;
      print(picked);
      hour = picked.hour;
      minute = picked.minute;
      saveToPrefs();
      print("changed to " + hour.toString());
      print("changed to " + minute.toString());
      if (hour > 12) {
        hourin12 = hour.toString();
        amorpm = "PM";
      } else {
        hourin12 = hour.toString();
        amorpm = "AM";
      }
      print(hourin12);
      if (minute < 10) {
        min00 = "0" + minute.toString();
      } else {
        min00 = minute.toString();
      }
      if (_showNotifi) {
        scheduleAlarm();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    var locations = tz.timeZoneDatabase.locations;
    fetchData();
    loadFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (_showNotifi) {
        scheduleAlarm();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Notification",
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
        child: Column(
          children: [
            FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 15, right: 0),
                      title: Text("Daily Notifications"),
                      subtitle: _showNotifi
                          ? Text("showing Notifications")
                          : Text("No Notifications"),
                      trailing: Switch(
                        value: _showNotifi,
                        onChanged: (val) {
                          _showNotifi = !_showNotifi;
                          setState(() {
                            if (_showNotifi) {
                              scheduleAlarm();
                            } else {
                              cancelNotif();
                            }
                            savePrefs();
                          });
                        },
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                }),
            FutureBuilder(
                future: loadFromPrefs(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 0),
                        title: Text('Time'),
                        subtitle: Text(hourin12.toString() +
                            " : " +
                            min00.toString() +
                            amorpm.toString()),
                        onTap: () {
                          selectTime(context);
                          // print("xxxxxx " + some.toString());
                        });
                  }
                  return CircularProgressIndicator();
                }),
            Image.asset(
              "lib/AllIcons/noti.png",
              width: 300,
              height: 340,
            ),
          ],
        ),
      ),
    );
  }

  var dateTime;
  scheduleAlarm() async {
    _showNotifi = true;
    savePrefs();
    dateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, hour, minute, 0);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'codex_logo',
      priority: Priority.max,
      importance: Importance.max,
      largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Todays forecast - $city',
      '$maxi $initialIn / $mini $initialIn - $deci - See the full forecast',
      tz.TZDateTime.from(dateTime, tz.local),
      //platformChannel,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    print("from notifications ");
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  loadFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    hour = prefs.getInt(setH) ?? 7;
    minute = prefs.getInt(setM) ?? 0;
    if (hour > 12) {
      hourin12 = hour - 12;
      amorpm = "PM";
    } else {
      hourin12 = hour;
      amorpm = "AM";
    }
    if (minute < 10) {
      min00 = "0" + minute.toString();
    } else {
      min00 = minute.toString();
    }
    print('loaded fro prefs' + hourin12.toString());
    print('loaded fro prefs' + minute.toString());

    return [hourin12, minute, amorpm, min00];
    // await _initPrefs();
  }

  fetchData() async {
    prefsb = await SharedPreferences.getInstance();
    _showNotifi = prefsb.getBool(setN) ?? true;

    return _showNotifi;
  }

  saveToPrefs() async {
    await _initPrefs();
    prefs.setInt(setH, hour);
    prefs.setInt(setM, minute);

    print('hours to prefs: ' + hour.toString());
    print('min to prefs: ' + minute.toString());
    print('from saveToPrefs');
  }

  savePrefs() async {
    await _initPrefs();
    prefs.setBool(setN, _showNotifi);
    // print('toggle to prefs: ' + _showNotifi.toString());
  }

  cancelNotif() async {
    await flutterLocalNotificationsPlugin.cancel(0);
    _showNotifi = false;
    savePrefs();
  }
}
