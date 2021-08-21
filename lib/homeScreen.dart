import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'package:sunshine/AllWidgets/ads.dart';
import 'package:sunshine/AllWidgets/aqiWidget.dart';
import 'package:sunshine/DataAndHttp/celcius.dart';
import 'package:sunshine/DataAndHttp/httpRequest.dart';
//import 'package:connectivity/connectivity.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/AllWidgets/allWidgets.dart';
import 'package:sunshine/AllWidgets/detailsWidget.dart';
import 'package:sunshine/AllWidgets/hourlyData.dart';
import 'package:sunshine/AllWidgets/dailyWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
//import 'package:permission_handler/permission_handler.dart';
//import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  _HomeScreenState my = new _HomeScreenState();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

var temp;
var min;
var max;
var minC;
var maxC;
var dec;
var cityy;
late String initial;
final keyIsFirstLoaded = 'is_first_loaded';
bool? isFirstLoaded;

class _HomeScreenState extends State<HomeScreen> {
  AdsClass ads = new AdsClass();
  bool setC = true;
  late SharedPreferences prefs;
  double xOffset = 0;
  double yOffset = 0;
  final String setCe = "inCelcius";
  double scaleFactor = 1;
  bool menuPressed = false;
  double radiusAmount = 0;
  var colorWhite = const Color(0xf8f8f8);
  var draggingleft;
  bool inCelcius = false;
  late bool isLocationOn;
  static const nativeAdUnitID =
      "ca-app-pub-3071933490034842/8224147098"; //real ad ca-app-pub-3071933490034842/8224147098
  final controller = NativeAdController();

  @override
  void initState() {
    super.initState();
    checkingInternet();
    ads.initializeInter();
    settingDay();
  }

  loadNativeAd() {
    controller.load(
      options: NativeAdOptions(),
      unitId: nativeAdUnitID,
    );
  }

  nativeAdCallbacks() {
    controller.onEvent.listen((e) {
      final event = e.keys.first;
      switch (event) {
        case NativeAdEvent.loading:
          print('loading');
          break;
        case NativeAdEvent.loaded:
          print('loaded');

          break;
        case NativeAdEvent.loadFailed:
          final errorCode = e.values.first;
          print('loadFailed $errorCode');
          break;

        default:
          break;
      }
    });
  }

  Future<bool> checkingInternet() async {
    bool isInternetOn;
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      isInternetOn = false;

      final snackBar = SnackBar(
          content: Text('Please connect to the Internet, and try again'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      isInternetOn = true;
    }
    return isInternetOn;
  }

  late bool isDay;
  settingDay() {
    var time = int.parse(new DateFormat.H().format(DateTime.now()));
    if (time >= 6 && time <= 17) {
      isDay = true;
    } else {
      isDay = false;
    }
    print("yo this is time $time and isDay is $isDay");
  }

  bool inC = false;
  var myc;
  load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
  }

  @override
  Widget build(BuildContext context) {
    load();
    ads.loadInterstitialAd();
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    myc = context.watch<Myc>();
    return Container(
        child: GestureDetector(
            child: AnimatedContainer(
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor),
              duration: Duration(milliseconds: 250),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(15),
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[800]
                    : Color(0xFFFBFBFB),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 50.0,
                  ),
                ],
              ),
              child: Container(
                child: Scaffold(
                    appBar: AppBar(
                      elevation: 0.0,
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey[900]
                              : Colors.white,
                      //title: Text("yyyy"),
                      leading: IconButton(
                        icon: Icon(Icons.menu),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white70
                            : Colors.grey[900],
                        tooltip: 'Menu Icon',
                        onPressed: () {
                          setState(() {
                            if (!menuPressed) {
                              xOffset = 230.0;
                              yOffset = 110.0;
                              scaleFactor = 0.8;
                              radiusAmount = 15;
                              menuPressed = true;

                              ads.showInterstitial();
                            } else {
                              xOffset = 0.0;
                              yOffset = 0.0;
                              scaleFactor = 1;
                              menuPressed = false;
                              radiusAmount = 0;
                            }
                          });
                        },
                      ),
                    ),
                    body: FutureBuilder(
                        future: checkingInternet(),
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data == true) {
                              return isFirstLoaded != null
                                  ? _buildApp()
                                  : afterDuration();
                            } else {
                              return Container(
                                child: Center(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Text(
                                        "You are not Connected to the Internet, Please check your Internet connection and try again",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          } else {
                            return isFirstLoaded != null
                                ? _buildApp()
                                : afterDuration();
                          }
                        })
                    //
                    ),
              ),
            ),
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              if (details.delta.dx < 0) {
                draggingleft = true;
              } else {
                draggingleft = false;
              }
            },
            onHorizontalDragEnd: (DragEndDetails details) {
              if (draggingleft) {
                setState(() {
                  xOffset = 0.0;
                  yOffset = 0.0;
                  scaleFactor = 1;
                  menuPressed = false;
                  radiusAmount = 0;
                  print("ended: " + details.toString());
                });
              }
            }));
  }

  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Location Permission"),
            content: new Text(
                "Sunshine need to access your location data to fetch the accurate climate conditions, we do not share or store your Location data"),
            actions: <Widget>[
              new TextButton(
                child: new Text("Dismiss"),
                onPressed: () {
                  Navigator.of(context).pop();
                  prefs.setBool(keyIsFirstLoaded, false);
                  _buildApp();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Widget afterDuration() {
    print("bool isFirstLoaded is $isFirstLoaded");
    return ChangeNotifierProvider(
      create: (_) => HttpRequest(),
      child: Consumer<HttpRequest>(builder: (context, request, child) {
        if (myc.inCelcius) {
          min = request.nextDayMinC;
          max = request.nextDayMaxC;
          initial = "C";
          print("its c $max $min");
        } else {
          min = request.nextDayMin;
          max = request.nextDayMax;
          initial = "F";
          print("its F $max $min");
        }
        cityy = request.area;
        dec = request.nextDayDescription;
        refresh() async {
          print('refreshing');
          await request.getCurrentLocationn();
          return null;
        }

        print("from home page celcius is${myc.inCelcius}");
        if (request.results == null) {
          Timer(Duration(seconds: 5), () {
            request.getCurrentLocationn();
          });
        }
        return Container(
          child: RefreshIndicator(
            child: request.results != null
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 15),
                                locationTitle(request.area),
                                dateAndTimeText(),
                                SizedBox(height: 35),
                                weatherImage(isDay, request.main),
                                SizedBox(height: 10),
                                temperatureText(
                                  myc.inCelcius
                                      ? request.mainTempInC.toStringAsFixed(0)
                                      : request.temp.toStringAsFixed(0),
                                  myc.inCelcius,
                                ),
                                SizedBox(height: 35),
                                descriptionText(
                                    Theme.of(context).brightness ==
                                        Brightness.dark,
                                    request.description),
                                SizedBox(height: 35),
                                heading("Details"),
                                drawLine(),
                                Container(
                                  margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                                  child: detailsWidget(
                                    Theme.of(context).brightness ==
                                        Brightness.dark,
                                    request.humidity,
                                    request.pressure,
                                    request.windSpeed,
                                    request.clouds,
                                    request.visibility,
                                    request.uvindex,
                                    request.dewPoint,
                                  ),
                                ),
                                SizedBox(height: 22),
                                SizedBox(height: 22),
                                heading("Hourly Forecast"),
                                drawLine(),
                                con(
                                    Theme.of(context).brightness ==
                                        Brightness.dark,
                                    isDay,
                                    myc.inCelcius
                                        ? request.hourlyTempInC
                                        : request.hourlyTempInC,
                                    request.hourlyTime,
                                    request.hourlyDescription),
                                SizedBox(height: 45),
                                heading("Daily Forecast"),
                                drawLine(),
                                dailyWidget(
                                    Theme.of(context).brightness ==
                                        Brightness.dark,
                                    isDay,
                                    myc.inCelcius
                                        ? request.dailyTempInC
                                        : request.dailyTemp,
                                    request.dailyTime,
                                    request.dailyDescription),
                                SizedBox(height: 45),
                                heading("Air Quality Index"),
                                drawLine(),
                                aqijust(request.aqii,
                                    MediaQuery.of(context).size.width),
                                aqiWidget(request.co, request.no, request.no2,
                                    request.o3, request.so2, request.aqii),
                                SizedBox(height: 60),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(child: Center(child: CircularProgressIndicator())),
            onRefresh: refresh,
          ),
        );
      }),
    );
  }

  Widget _buildApp() {
    print("bool isFirstLoaded is $isFirstLoaded");
    return ChangeNotifierProvider(
      create: (_) => HttpRequest(),
      child: Consumer<HttpRequest>(builder: (context, request, child) {
        print("zambzooooo.......${request.dailyTemp}");
        if (myc.inCelcius) {
          min = request.nextDayMinC;
          max = request.nextDayMaxC;
          initial = "C";
          print("its c $max $min");
        } else {
          min = request.nextDayMin;
          max = request.nextDayMax;
          initial = "F";
          print("its F $max $min");
        }
        cityy = request.area;
        dec = request.nextDayDescription;
        refresh() async {
          print('refreshing');
          await request.getCurrentLocationn();
          return null;
        }

        print("from home page celcius is${myc.inCelcius}");
        if (request.results == null) {
          request.getCurrentLocationn();
        }
        return RefreshIndicator(
          child: request.results != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 15),
                              locationTitle(request.area),
                              dateAndTimeText(),
                              SizedBox(height: 35),
                              weatherImage(isDay, request.main),
                              SizedBox(height: 10),
                              temperatureText(
                                myc.inCelcius
                                    ? request.mainTempInC.toStringAsFixed(0)
                                    : request.temp.toStringAsFixed(0),
                                myc.inCelcius,
                              ),
                              SizedBox(height: 35),
                              descriptionText(
                                  Theme.of(context).brightness ==
                                      Brightness.dark,
                                  request.description),
                              SizedBox(height: 35),
                              heading("Details"),
                              drawLine(),
                              Container(
                                margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                                child: detailsWidget(
                                  Theme.of(context).brightness ==
                                      Brightness.dark,
                                  request.humidity,
                                  request.pressure,
                                  request.windSpeed,
                                  request.clouds,
                                  request.visibility,
                                  request.uvindex,
                                  request.dewPoint,
                                ),
                              ),
                              SizedBox(height: 22),
                              nativeAdAdmob(),
                              SizedBox(height: 22),
                              heading("Hourly Forecast"),
                              drawLine(),
                              con(
                                  Theme.of(context).brightness ==
                                      Brightness.dark,
                                  isDay,
                                  myc.inCelcius
                                      ? request.hourlyTempInC
                                      : request.hourlyTempInC,
                                  request.hourlyTime,
                                  request.hourlyDescription),
                              SizedBox(height: 45),
                              heading("Daily Forecast"),
                              drawLine(),
                              dailyWidget(
                                  Theme.of(context).brightness ==
                                      Brightness.dark,
                                  isDay,
                                  myc.inCelcius
                                      ? request.dailyTempInC
                                      : request.dailyTemp,
                                  request.dailyTime,
                                  request.dailyDescription),
                              SizedBox(height: 45),
                              heading("Air Quality Index"),
                              drawLine(),
                              aqijust(request.aqii,
                                  MediaQuery.of(context).size.width),
                              aqiWidget(request.co, request.no, request.no2,
                                  request.o3, request.so2, request.aqii),
                              SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(child: Center(child: CircularProgressIndicator())),
          onRefresh: refresh,
        );
      }),
    );
  }

  Widget drawLine() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
      margin: EdgeInsets.fromLTRB(30, 1, 30, 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
    );
  }

  Widget nativeAdAdmob() {
    return NativeAd(
      controller: controller,
      height: 300,
      unitId: nativeAdUnitID,
      builder: (context, child) {
        return Material(
          elevation: 0,
          child: child,
        );
      },
      buildLayout: mediumAdTemplateLayoutBuilder,
      icon: AdImageView(size: 40),
      headline: AdTextView(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        maxLines: 1,
      ),
      body: AdTextView(style: TextStyle(color: Colors.black), maxLines: 1),
      media: AdMediaView(
        height: 170,
        width: MATCH_PARENT,
      ),
      attribution: AdTextView(
        width: WRAP_CONTENT,
        text: 'Ad',
        decoration: AdDecoration(
          border: BorderSide(color: Colors.green, width: 1),
          borderRadius: AdBorderRadius.all(10.0),
        ),
        style: TextStyle(color: Colors.green, fontSize: 10),
        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
      ),
      button: AdButtonView(
        elevation: 18,
        height: 50,
        decoration: AdDecoration(
          backgroundColor: Colors.blue,
          borderRadius: AdBorderRadius.all(17.0),
        ),
        //height: MATCH_PARENT,
        textStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
