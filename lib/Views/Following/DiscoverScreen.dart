import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_up_live/Widgets/bottomNavBar.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreenState createState() => DiscoverScreenState();
}

class DiscoverScreenState extends State<DiscoverScreen> {
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
                      color: Color(0xffEFEFEF),
                      child: Text(
                        "Following",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Medium",
                            color: Color(0xff3E3E3E)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 205,
                      height: 40,
                      color: Color(0xffFF6F00),
                      child: Text(
                        "Discover",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Medium",
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                Card(
                  elevation: 1,
                  margin:
                      EdgeInsets.only(top: 22, left: 17, right: 18, bottom: 21),
                  color: Colors.white,
                  child: Container(
                    height: 226,
                    width: 182,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 110,
                          child: Image.asset("assets/images/audi.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          child: Text(
                            "Audi Club",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Medium",
                                color: Color(0xff3B3B3B)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(right: 10),
                                child:
                                    SvgPicture.asset("assets/images/user.svg")),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "5.7K Pullup Members",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Regular",
                                    color: Color(0xff3B3B3B)),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/joinClubScreen');
                          },
                          child: Container(
                            width: 96,
                            height: 26,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffDBDBDB)),
                            child: Text(
                              "Join",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Medium",
                                  color: Color(0xff414141)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
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
