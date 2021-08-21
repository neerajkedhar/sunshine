//import 'dart:js';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:sunshine/DataAndHttp/dataClass.dart';
import 'package:sunshine/DataAndHttp/httpRequest.dart';
// import 'package:sunshine/main.dart';
// import 'package:sunshine/themeChange.dart';
import 'package:sunshine/AllWidgets/returnIcon.dart';
import 'package:sunshine/AllWidgets/returnDescription.dart';

Widget locationTitle(var area) {
  return Center(
    child: Container(
      child: Text(area!.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 30,
          )),
    ),
  );
}

boss(var check) {
  if (check == 'clouds') {
    return cloudRain;
  }
}

Widget weatherImage(bool isDay, var icon) {
  return Center(
    child: Image.asset(
      returnIcon(isDay, icon),
      width: 175,
      height: 175,
    ),
  );
}

Widget dateAndTimeText() {
  var time = new DateFormat.MMMd().format(DateTime.now());
  var monthDate = new DateFormat.jm().format(DateTime.now());
  return ChangeNotifierProvider(
      create: (_) => HttpRequest(),
      child: Consumer<HttpRequest>(builder: (context, request, child) {
        return Center(
          child: Container(
            child: Text('$time | $monthDate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
          ),
        );
      }));
}

Widget descriptionText(bool dark, String desc) {
  // isDark = changer.darkThemeWidgets;
  return Container(
    child: Center(
      child: Container(
        //color: Colors.green,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Text(returningDesc(desc),
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.w500,
              color: dark ? Colors.white70 : Colors.grey[900],
              fontSize: 20,
            )),
      ),
    ),
  );
}

Widget heading(String header) {
  return Container(
    margin: EdgeInsets.fromLTRB(30, 1, 30, 1),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(
            // color: request.darkTheme ? Colors.white : Colors.black,
            // height: 1.4,
            fontSize: 17,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget weatherElementWidget(bool color, isDay, var temperature, time, main) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        returnDailyIcon(main),
        width: 40,
        height: 40,
      ),
      SizedBox(height: 5),
      Container(
        //  color: Colors.pink,
        child: Row(children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              // height: 85,
              //  color: Colors.green,
              child: Text(
                temperature != null ? temperature.toString() : "31",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(width: 1),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 30,
              margin: const EdgeInsets.only(top: 8),
              // color: Colors.green,
              child: Text(
                "o",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ]),
      ),
      SizedBox(height: 5),
      Text(
        time != null ? time.toString() : "00:00 am",
        style: TextStyle(
            color: color ? Colors.white70 : Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w300),
      ),
    ],
  );
}

Widget temperatureText(var temp, bool isC) {
  print('fromTemp $isC');

  return Center(
    child: Container(
      // width: 170,
      // height: 85,
      // color: Colors.pink,
      child: Row(
        //  crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            temp,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 85,
            ),
          ),
          Text(
            "\u00B0",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 85,
            ),
          ),
          SizedBox(width: 0),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Text(
          //     isC ? "C" : "F",
          //     style: TextStyle(
          //       fontWeight: FontWeight.w300,
          //       fontSize: 75,
          //     ),
          //   ),
          // )
        ],
      ),
    ),
  );
}

Widget weatherElementWidgetHourly(bool color, var temperature, time, main) {
  // print(time);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        returnIconH(main, time),
        width: 40,
        height: 40,
      ),
      SizedBox(height: 5),
      Container(
        //  color: Colors.pink,
        child: Row(children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              // height: 85,
              //  color: Colors.green,
              child: Text(
                temperature != null ? temperature.toString() : "31",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(width: 1),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 30,
              margin: const EdgeInsets.only(top: 8),
              // color: Colors.green,
              child: Text(
                "o",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ]),
      ),
      SizedBox(height: 5),
      Text(
        time != null ? new DateFormat.j().format(time).toString() : "00:00 am",
        style: TextStyle(
            color: color ? Colors.white70 : Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w300),
      ),
    ],
  );
}
