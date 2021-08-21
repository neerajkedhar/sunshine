import 'package:flutter/material.dart';
//import 'package:sunshine/AllWidgets/ads.dart';
import 'package:sunshine/mainPage.dart';
import 'package:share/share.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.grey[900],
            )),
        elevation: 0,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white70,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
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
          SizedBox(height: 30),
          Center(
            child: Image.asset(
              "lib/AllIcons/codex_logo.png",
              width: 75,
              height: 75,
            ),
          ),
          SizedBox(height: 20),
          Text("SunShine",
              style: TextStyle(
                fontFamily: 'Dancing Script',
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )),
          Text("V1.0.3.2021",
              style: TextStyle(
                // fontWeight: FontWeight.regular,
                fontSize: 15,
              )),
          ListTile(
              contentPadding: EdgeInsets.only(left: 15, right: 0),
              title: Text("Invite a friend"),
              subtitle: Text('Invite your friends to use SunShine'),
              onTap: () {
                Share.share(
                    "https://play.google.com/store/apps/details?id=com.kedhar.sunshine");
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 15, right: 0),
              title: Text("Rate Us"),
              subtitle: Text(
                  'Like SunShine Weather App? Let us know by giving a 5-star rating.'),
              onTap: () {
                LaunchReview.launch(
                  androidAppId: "com.kedhar.sunshine",
                );
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 15, right: 0),
              title: Text("Report"),
              subtitle: Text(
                'Found any bugs or have any suggestions?Let us know!',
              ),
              onTap: () {
                LaunchReview.launch(
                  androidAppId: "com.kedhar.sunshine",
                );
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 15, right: 0),
              title: Text("Privacy Policy"),
              onTap: () {
                _launchUrl();
              }),
          // facebookNativeAd(
          //   Theme.of(context).brightness == Brightness.dark,
          // ),
        ]),
      ),
    );
  }
}

_launchUrl() async {
  const url =
      "https://kedhar-app-development-studios.github.io/Privacy-Policy/";
  if (await canLaunch(url)) {
    launch(url);
  } else {
    throw "could not launch";
  }
}
