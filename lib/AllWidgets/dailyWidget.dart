import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//import 'package:sunshine/DataAndHttp/dataClass.dart';

import 'package:sunshine/AllWidgets/allWidgets.dart';

Widget dailyWidget(bool color, isDay, dailyTemp, dailyTime, dailyMain) {
  return Container(
      // color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            weatherElementWidget(color, isDay, dailyTemp[0],
                new DateFormat.MMMd().format(dailyTime[0]), dailyMain[0]),
            SizedBox(width: 30),
            weatherElementWidget(color, isDay, dailyTemp[1],
                new DateFormat.MMMd().format(dailyTime[1]), dailyMain[1]),
            SizedBox(width: 30),
            weatherElementWidget(color, isDay, dailyTemp[2],
                new DateFormat.MMMd().format(dailyTime[2]), dailyMain[2]),
            SizedBox(width: 30),
            weatherElementWidget(color, isDay, dailyTemp[3],
                new DateFormat.MMMd().format(dailyTime[3]), dailyMain[3]),
            SizedBox(width: 30),
            weatherElementWidget(color, isDay, dailyTemp[4],
                new DateFormat.MMMd().format(dailyTime[4]), dailyMain[4]),
            SizedBox(width: 30),
            weatherElementWidget(color, isDay, dailyTemp[5],
                new DateFormat.MMMd().format(dailyTime[5]), dailyMain[5]),
            SizedBox(width: 30),
            weatherElementWidget(color, isDay, dailyTemp[6],
                new DateFormat.MMMd().format(dailyTime[6]), dailyMain[6]),
            SizedBox(width: 30),
          ])));
}
