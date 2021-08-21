import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/DataAndHttp/celcius.dart';
//import 'package:sunshine/dragableWidget.dart';
import 'package:sunshine/drawerScreen.dart';
import 'package:sunshine/homeScreen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => Myc(false, true),
        child: Scaffold(
            body: Stack(
          children: [
            DrawerScreen(),
            HomeScreen(),
          ],
        )));
  }
}
