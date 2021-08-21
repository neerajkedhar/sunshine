import 'package:flutter/material.dart';
import 'package:sunshine/DataAndHttp/aboutUs.dart';
import 'package:sunshine/DataAndHttp/celcius.dart';
import 'package:sunshine/DataAndHttp/notifications.dart';
import 'package:sunshine/homeScreen.dart';
import 'package:sunshine/themeChange.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var iconData = FaIcon(FontAwesomeIcons.arrowLeft);

  @override
  Widget build(BuildContext context) {
    final myc = context.watch<Myc>();
    HomeScreen hh = new HomeScreen();
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: new EdgeInsets.only(
          left: 10,
          right: 190,
          top: 120,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<ThemeChanger>(
                builder: (context, changer, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 0, bottom: 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Settings',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 40,
                                    )),
                              ])),
                      SizedBox(height: 40),
                      ListTile(
                          contentPadding: EdgeInsets.only(left: 15, right: 0),
                          title: Text("Theme"),
                          subtitle:
                              changer.darkTheme ? Text('Dark') : Text('Light'),
                          onTap: () {
                            changer.toggleTheme();
                          }),
                      ListTile(
                          contentPadding: EdgeInsets.only(left: 15, right: 0),
                          subtitle: myc.inCelcius
                              ? Text('Celcius')
                              : Text('Farenheit'),
                          title: Text("Temperature Units"),
                          onTap: () {
                            myc.increment();
                          }),
                      ListTile(
                          contentPadding: EdgeInsets.only(left: 15, right: 0),
                          title: Text("Notifications"),
                          subtitle: Text('Daily Notifications'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                    create: (_) => Myc(false, true),
                                    child: Notifications()),
                              ),
                            );
                          }),
                      ListTile(
                          contentPadding: EdgeInsets.only(left: 15, right: 0),
                          title: Text("Feedback"),
                          subtitle: Text('Report bugs or suggestions'),
                          onTap: () {
                            LaunchReview.launch(
                              androidAppId: "com.kedhar.sunshine",
                              iOSAppId: "585027354",
                            );
                          }),
                      ListTile(
                          contentPadding: EdgeInsets.only(left: 15, right: 0),
                          title: Text("About Us"),
                          subtitle: Text('Version 1.0.3'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AboutUs(),
                              ),
                            );
                          }),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
