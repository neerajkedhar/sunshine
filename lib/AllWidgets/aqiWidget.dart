//import 'dart:html';

import 'package:flutter/material.dart';

Widget aqijust(var aqi, var width) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 3, 0, 1),
    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
    child: Row(
      children: [
        Text(
          "$aqi",
          style: TextStyle(
              fontSize: 75, fontWeight: FontWeight.bold, color: colorss(aqi)),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  returnAqiDesc(aqi),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Row(children: [
                Expanded(
                  child: Text(
                    returnAqiText(aqi),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget aqiWidget(var co, no, no2, o3, so2, aqi) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 3, 0, 1),
    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
    child: Column(
      children: [
        // Container(
        //   margin: EdgeInsets.fromLTRB(0, 1, 30, 1),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Text(
        //         "Components",
        //         style: TextStyle(
        //           // color: request.darkTheme ? Colors.white : Colors.black,
        //           // height: 1.4,
        //           fontSize: 17,
        //           letterSpacing: 1.0,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Corbon Monoxide",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                child: Text(
                  "$co \u03BCg/m\u00b3",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Nitrogen Monoxide",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                child: Text(
                  "$no \u03BCg/m\u00b3",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Nitrogen Dioxide",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                child: Text(
                  "$no2 \u03BCg/m\u00b3",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Ozone",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                child: Text(
                  "$o3 \u03BCg/m\u00b3",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Sulphur Dioxide",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                child: Text(
                  "$so2 \u03BCg/m\u00b3",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

const red = const Color(0xfff44336);
const orange = const Color(0xffff9800);
const yellow = const Color(0xffffee58);
const green = const Color(0xff66bb6a);
const blue = const Color(0xff42a5f5);
String returnAqiText(var aqi) {
  if (aqi >= 5) {
    return ("Sensitive Groups may experiance some health effects");
  } else if (aqi == 4) {
    return ("May cause breathing difficulties in people with lung disease");
  } else if (aqi == 3) {
    return ("Air pollution poses little or no risk");
  } else if (aqi == 2) {
    return ("Minimal or no Impact on health");
  } else if (aqi == 1) {
    return ("Air Quality is Good");
  } else {
    return ("Air Quality not available");
  }
}

String returnAqiDesc(var aqi) {
  if (aqi >= 5) {
    return ("Very Poor and Unhealthy");
  } else if (aqi == 4) {
    return ("Poor Air Quality");
  } else if (aqi == 3) {
    return ("Moderate");
  } else if (aqi == 2) {
    return ("Fair");
  } else {
    return ("Good");
  }
}

Color colorss(var aqii) {
  if (aqii == 5) {
    return red;
  } else if (aqii == 4) {
    return orange;
  } else if (aqii == 3) {
    return yellow;
  } else if (aqii == 2) {
    return green;
  } else if (aqii == 1) {
    return blue;
  } else {
    return Colors.black;
  }
}
