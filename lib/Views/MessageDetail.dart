import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_up_live/Widgets/bottomNavBar.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class MessageDetailScreen extends StatefulWidget {
  MessageDetailScreenState createState() => MessageDetailScreenState();
}

class MessageDetailScreenState extends State<MessageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xffF4F5F9),
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      "assets/images/Ellipse 10.png",
                      height: 33,
                      width: 33,
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 18,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        color: Color(0xff32C50F),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  child: Text(
                "Kathie",
                style: TextStyle(
                    fontSize: 16, fontFamily: "Regular", color: Colors.black),
              )),
              Spacer(),
              Container(
                child: SvgPicture.asset(
                  "assets/images/dots.svg",
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 21,
                ),
                Container(
                  height: 56,
                  width: 362,
                  decoration: BoxDecoration(
                      color: Color(0xffFF814A),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 11),
                            child: Text(
                              "Hi Matt! Do you have a moment?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Regular",
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16, bottom: 8),
                            child: Text(
                              "12:17pm",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Light",
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Container(
                  height: 56,
                  width: 362,
                  margin: EdgeInsets.only(left: 51),
                  decoration: BoxDecoration(
                      color: Color(0xff2D77FF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 11),
                            child: Text(
                              "Hi Matt! Do you have a moment?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Regular",
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16, bottom: 8),
                            child: Text(
                              "12:17pm",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Light",
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Container(
                  height: 56,
                  width: 362,
                  decoration: BoxDecoration(
                      color: Color(0xffFF814A),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 11),
                            child: Text(
                              "Hi Matt! Do you have a moment?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Regular",
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16, bottom: 8),
                            child: Text(
                              "12:17pm",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Light",
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Container(
                  height: 56,
                  width: 362,
                  margin: EdgeInsets.only(left: 51),
                  decoration: BoxDecoration(
                      color: Color(0xff2D77FF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 11),
                            child: Text(
                              "Hi Matt! Do you have a moment?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Regular",
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 16, bottom: 8),
                            child: Text(
                              "12:17pm",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Light",
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 15, bottom: 19, right: 15),
          height: 45,
          width: 384,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(23),
              border: Border.all(color: Color(0xffE1E1E1), width: 1)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 35,
                  width: 35,
                  margin:
                      EdgeInsets.only(left: 6, top: 5, bottom: 5, right: 11),
                  padding:
                      EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff144FBB),
                  ),
                  child: SvgPicture.asset(
                    "assets/images/profile/camera.svg",
                    height: 13.29,
                    width: 15.63,
                    color: Colors.white,
                  )),
              Container(
                width: 260,
                padding: EdgeInsets.only(top: 5, bottom: 5, right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Messages...",
                      hintStyle: TextStyle(
                          fontFamily: "Light",
                          fontSize: 14,
                          color: Color(0xffB4B4B4))),
                ),
              ),
              Container(
                  height: 30,
                  width: 30,
                  padding: EdgeInsets.only(top: 5, bottom: 5, right: 10),
                  child: Image.asset(
                    "assets/images/mic.png",
                    height: 22,
                    width: 16.5,
                  )),
              Container(
                  height: 30,
                  width: 30,
                  padding: EdgeInsets.only(top: 5, bottom: 5, right: 10),
                  child: Image.asset(
                    "assets/images/image-square.png",
                    height: 22,
                    width: 16.5,
                  )),
            ],
          ),
        ),
      );
    });
  }
}
