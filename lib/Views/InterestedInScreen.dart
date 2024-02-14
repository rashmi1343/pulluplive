import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class InterestedInScreen extends StatefulWidget {
  InterestedInScreenState createState() => InterestedInScreenState();
}

class InterestedInScreenState extends State<InterestedInScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            width: double.infinity,
            height: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 55,
                ),
                SizedBox(
                  height: 64,
                  child: Row(
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
                        margin: EdgeInsets.only(
                          left: 121.4,
                        ),
                        height: 28.47,
                        width: 97,
                        child: Image.asset("assets/images/pull-logo-2.png"),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: SvgPicture.asset("assets/images/dots.svg"),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 219,
                  child: Image.asset("assets/images/interested.png"),
                ),
                Container(
                  width: 414,
                  height: 82,
                  color: Color(0xffFF6F00),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Auto Expo 2021",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "SemiBold",
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/clock-circle.svg",
                            color: Colors.white,
                            height: 12,
                            width: 12,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "February 10, 12 am",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Medium",
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing\nand typesetting industry. Lorem Ipsum has been\nthe industry's standard dummy text ever since\nthe 1500s.",
                    style: TextStyle(
                        fontFamily: "Regular",
                        fontSize: 15,
                        color: Color(0xff303030)),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Attending Members",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Medium",
                                  color: Colors.black),
                            ),
                            Text(
                              "37K Members",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Medium",
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 23.5,
                        ),
                        Container(
                          height: 44,
                          width: 1,
                          color: Color(0xff707070),
                        ),
                        SizedBox(
                          width: 19.5,
                        ),
                        Column(
                          children: [
                            Text(
                              "Attending Vehicles",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Medium",
                                  color: Colors.black),
                            ),
                            Text(
                              "7K Vehicles",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Medium",
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 21,
                ),
                Container(
                  child: Text(
                    "Entry fees",
                    style: TextStyle(
                        color: Color(0xffFF6F00),
                        fontSize: 14,
                        fontFamily: "Medium"),
                  ),
                ),
                Container(
                  child: Text(
                    "50.00",
                    style: TextStyle(
                        color: Color(0xff144FBB),
                        fontSize: 21,
                        fontFamily: "Medium"),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    margin:
                        const EdgeInsets.only(right: 15, left: 15, bottom: 10),
                    height: 46,
                    width: 384,
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
                          Navigator.of(context).pushNamed('/celebration');
                        },
                        child: const Text(
                          'INTERESTED IN',
                          style: TextStyle(
                              color: ColorTheme.themeWhiteColor,
                              fontSize: 14,
                              fontFamily: "Regular"),
                        ),
                      ),
                    ),
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
