import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class Settings extends StatefulWidget {
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xffF9FFFF),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  // The containers in the background
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 234.64,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff1F4FB2),
                              Color(0xffFF4F00),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 44.7,
                              width: 155,
                              margin: EdgeInsets.only(top: 55),
                              child: Image.asset(
                                  "assets/images/splash/pull-logo.png"),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 26.63, bottom: 19),
                                child: Text(
                                  "Settings",
                                  style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 19,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 384,
                        decoration: BoxDecoration(
                          color: Color(0xffF9FFFF),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff00000017),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                          ],
                        ),
                      )
                    ],
                  ),
                  // The card widget with top padding,
                  // incase if you wanted bottom padding to work,
                  // set the `alignment` of container to Alignment.bottomCenter
                  Container(
                    height: 422,
                    width: 384,
                    margin: EdgeInsets.only(
                        left: 15, right: 15, bottom: 19, top: 160),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff00000017),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              'Notification management',
                              style: TextStyle(
                                  fontFamily: "Medium",
                                  fontSize: 15,
                                  color: Color(0xff4B4B4B)),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Color(0xff4B4B4B),
                            margin: EdgeInsets.only(left: 15, right: 20),
                          ),
                          ListTile(
                            title: Text(
                              'SOS',
                              style: TextStyle(
                                  fontFamily: "Medium",
                                  fontSize: 15,
                                  color: Color(0xff4B4B4B)),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Color(0xff4B4B4B),
                            margin: EdgeInsets.only(left: 15, right: 20),
                          ),
                          ListTile(
                            title: Text(
                              'My Account',
                              style: TextStyle(
                                  fontFamily: "Medium",
                                  fontSize: 15,
                                  color: Color(0xff4B4B4B)),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Color(0xff4B4B4B),
                            margin: EdgeInsets.only(left: 15, right: 20),
                          ),
                          ListTile(
                            title: Text(
                              'T & C',
                              style: TextStyle(
                                  fontFamily: "Medium",
                                  fontSize: 15,
                                  color: Color(0xff4B4B4B)),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Color(0xff4B4B4B),
                            margin: EdgeInsets.only(left: 15, right: 20),
                          ),
                          ListTile(
                            title: Text(
                              'My Subscriptions',
                              style: TextStyle(
                                  fontFamily: "Medium",
                                  fontSize: 15,
                                  color: Color(0xff4B4B4B)),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Color(0xff4B4B4B),
                            margin: EdgeInsets.only(left: 15, right: 20),
                          ),
                          ListTile(
                            title: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  fontFamily: "Medium",
                                  fontSize: 15,
                                  color: Color(0xff4B4B4B)),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Color(0xff4B4B4B),
                            margin: EdgeInsets.only(left: 15, right: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/paySecurely');
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20, top: 17.5),
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Medium",
                                    color: Color(0xffFF4F00)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
