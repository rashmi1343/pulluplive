import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_up_live/Widgets/bottomNavBar.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class FollowingScreen extends StatefulWidget {
  FollowingScreenState createState() => FollowingScreenState();
}

class FollowingScreenState extends State<FollowingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Container(
            height: 30,
            width: 105,
            child: Image.asset("assets/images/pull-logo-2.png"),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                "assets/images/search.svg",
                color: Colors.black,
                height: 18,
                width: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Image.asset(
                "assets/images/bell.png",
                color: Colors.black,
                height: 18,
                width: 18,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 205,
                      height: 40,
                      color: Color(0xffFF6F00),
                      child: Text(
                        "Following",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Medium",
                            color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/discoverScreen');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 205,
                        height: 40,
                        color: Color(0xffEFEFEF),
                        child: Text(
                          "Discover",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Medium",
                              color: Color(0xff3E3E3E)),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 18, top: 27, right: 15),
                      child: Stack(
                        children: [
                          Container(
                            height: 53,
                            width: 53,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(43),
                                border: Border.all(
                                    color: Color(0xff65D80E), width: 2)),
                            child: CircleAvatar(
                              radius: 43,
                              backgroundImage:
                                  AssetImage('assets/images/discover.png'),
                            ),
                          ),
                          Positioned(
                            bottom: 0.2,
                            right: 0.1,
                            child: Container(
                              height: 16,
                              width: 16,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SvgPicture.asset(
                                    "assets/images/green_tick.svg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Mark CM Founderr",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "SemiBold",
                                      color: Color(0xff3B3B3B)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Follow",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Regular",
                                      color: Color(0xffFF6F00)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Posted in ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Regular",
                                      color: Color(0xff0054FF)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                // margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Mercedes Club",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Medium",
                                      color: Color(0xff3B3B3B)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "16 h",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Regular",
                                      color: Color(0xff9E9E9E)),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  // margin: EdgeInsets.only(left: 10),
                                  child: SvgPicture.asset(
                                      "assets/images/user-clock.svg"))
                            ],
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 7),
                      child: SvgPicture.asset("assets/images/dots.svg"),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 12),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing\nand typesetting industry.",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Regular",
                        color: Colors.black),
                  ),
                ),
                Container(
                  height: 201,
                  margin: EdgeInsets.only(top: 10, bottom: 12),
                  child: Image.asset("assets/images/discover.png"),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff0054FF),
                      ),
                      padding: EdgeInsets.all(5),
                      child: SvgPicture.asset("assets/images/like-solid.svg"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        "23",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Regular",
                            color: Color(0xff444444)),
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 13),
                      child: Text(
                        "1.5K Comments",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Regular",
                            color: Color(0xff444444)),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: Color(0xffE4E4E4),
                  margin: EdgeInsets.only(top: 15.5),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 18,
                      width: 18,
                      child: SvgPicture.asset("assets/images/like.svg"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        "Like",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Regular",
                            color: Color(0xff444444)),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 18,
                      width: 18,
                      child: SvgPicture.asset("assets/images/comment.svg"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        "Comment",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Regular",
                            color: Color(0xff444444)),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 18,
                      width: 18,
                      child: SvgPicture.asset("assets/images/share.svg"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 8, right: 13),
                      child: Text(
                        "Share",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Regular",
                            color: Color(0xff444444)),
                      ),
                    ),
                  ],
                ),
              ],
            )),
        bottomNavigationBar: bottomBar(context, provider),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset("assets/images/circle_add.svg"),
          onPressed: () {},
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      );
    });
  }
}
