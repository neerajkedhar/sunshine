import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//import 'package:sunshine/DataAndHttp/dataClass.dart';
// import 'package:sunshine/DataAndHttp/httpRequest.dart';
// import 'package:sunshine/main.dart';
// import 'package:sunshine/themeChange.dart';

Widget detailsWidget(bool color, humidity, pressure, windspeed, clouds,
    visibility, uvindex, dewPoint) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 3, 0, 1),
    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
    child: Column(children: [
      Container(
        margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                "Humidity",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              child: Text(
                humidity != null ? humidity.toString() + " %" : "0",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
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
                "Pressure",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              child: Text(
                pressure != null ? pressure.toString() + "  hPa" : "0",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
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
                "Wind speed",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              child: Text(
                windspeed != null ? windspeed.toString() + " Mph" : "0",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
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
                "Clouds",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              child: Text(
                clouds != null ? clouds.toString() + " %" : "0",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
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
                "Visibility",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              child: Text(
                visibility != null ? visibility.toString() + " Km" : "0",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
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
                "UV Index",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              child: Text(
                uvindex != null ? uvindex.toString() + " nm" : "0",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
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
                "Dew Point",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              child: Text(
                dewPoint != null ? dewPoint.toString() : "0",
                style: TextStyle(
                    color: color ? Colors.white70 : Colors.grey[900],
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}
