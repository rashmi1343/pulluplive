import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xffF9FFFF),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 55,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    Container(
                        child: Text(
                      "Notifications",
                      style: TextStyle(
                        fontFamily: "Medium",
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    )),
                    Spacer(),
                    Container(
                      height: 18,
                      width: 18,
                      margin: EdgeInsets.only(right: 15),
                      child: SvgPicture.asset("assets/images/search.svg"),
                    )
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Container(
                        height: 62,
                        width: 62,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset("assets/images/profile.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Julia Dawson sent you a request.",
                              style: TextStyle(
                                  fontFamily: "Regular", fontSize: 13),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Just Now",
                              style: TextStyle(
                                  fontFamily: "Regular",
                                  fontSize: 13,
                                  color: Color(0xff535353)),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Align(
                              child: Row(
                                children: [
                                  Container(
                                    height: 28,
                                    width: 97,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26.0),
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xff1F4FB2),
                                          Color(0xffFF4F00),
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () {
                                          // Navigator.of(context).pushNamed(
                                          //     '/createProfileStepThree');
                                        },
                                        child: const Text(
                                          'ACCEPT',
                                          style: TextStyle(
                                              color: ColorTheme.themeWhiteColor,
                                              fontSize: 12,
                                              fontFamily: "Regular"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    height: 28,
                                    width: 97,
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xff6A6A6A),
                                            Color(0xff434343),
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(26.0),
                                        color: Color(0xff727272)),
                                    child: Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () {
                                          //   Navigator.of(context).pushNamed('/otp');
                                        },
                                        child: const Text(
                                          'REJECT',
                                          style: TextStyle(
                                              color: ColorTheme.themeWhiteColor,
                                              fontSize: 12,
                                              fontFamily: "Regular"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.5,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.5, right: 14.5),
                  height: 1,
                  color: Color(0xffBBBBBB),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15.5),
                  child: Row(
                    children: [
                      Container(
                        height: 62,
                        width: 62,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset("assets/images/profile.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Neil Sans add a new post.",
                              style: TextStyle(
                                  fontFamily: "Regular", fontSize: 13),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "7 hours ago",
                              style: TextStyle(
                                  fontFamily: "Regular",
                                  fontSize: 13,
                                  color: Color(0xff535353)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
