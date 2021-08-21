import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

//import 'package:sunshine/DataAndHttp/dataClass.dart';

import 'package:sunshine/AllWidgets/allWidgets.dart';

Widget con(bool color, isDay, hourlyTemp, hourlyTime, hourlyMain) {
  return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            weatherElementWidgetHourly(
                color, hourlyTemp[0], hourlyTime[0], hourlyMain[0]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[1], hourlyTime[1], hourlyMain[1]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[2], hourlyTime[2], hourlyMain[2]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[3], hourlyTime[3], hourlyMain[3]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[4], hourlyTime[4], hourlyMain[4]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[5], hourlyTime[5], hourlyMain[5]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[6], hourlyTime[6], hourlyMain[6]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[7], hourlyTime[7], hourlyMain[7]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[8], hourlyTime[8], hourlyMain[8]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[9], hourlyTime[9], hourlyMain[9]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[10], hourlyTime[10], hourlyMain[10]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[11], hourlyTime[11], hourlyMain[11]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[12], hourlyTime[12], hourlyMain[12]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[13], hourlyTime[13], hourlyMain[13]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[14], hourlyTime[14], hourlyMain[14]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[15], hourlyTime[15], hourlyMain[15]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[16], hourlyTime[16], hourlyMain[16]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[17], hourlyTime[17], hourlyMain[17]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[18], hourlyTime[18], hourlyMain[18]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[19], hourlyTime[19], hourlyMain[19]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[20], hourlyTime[20], hourlyMain[20]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[21], hourlyTime[21], hourlyMain[21]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[22], hourlyTime[22], hourlyMain[22]),
            SizedBox(width: 30),
            weatherElementWidgetHourly(
                color, hourlyTemp[23], hourlyTime[23], hourlyMain[23]),
            SizedBox(width: 30),
          ])));
}
