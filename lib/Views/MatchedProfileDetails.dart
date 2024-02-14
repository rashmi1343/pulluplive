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

class MatchedProfileDetailsScreen extends StatefulWidget {
  MatchedProfileDetailsScreenState createState() =>
      MatchedProfileDetailsScreenState();
}

class MatchedProfileDetailsScreenState
    extends State<MatchedProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final items = [
      Image.asset('assets/images/pic.png'),
      Image.asset('assets/images/pic.png'),
      Image.asset('assets/images/pic.png'),
    ];

    int currentIndex = 0;
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          toolbarHeight: 1,
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //height: 388,
                // margin: EdgeInsets.only(left: 10, right: 10),
                child: Stack(
                  children: <Widget>[
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 388,
                        viewportFraction: 1,
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      items: items,
                    ),
                    Positioned(
                      top: 366,
                      left: 187,
                      child: DotsIndicator(
                          dotsCount: items.length,
                          position: currentIndex,
                          decorator: DotsDecorator(
                              activeColor: Colors.white, color: Colors.grey)),
                    ),
                    Positioned(
                      left: 18,
                      top: 14,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                    Positioned(
                        right: 20,
                        top: 24,
                        child: Container(
                          child: SvgPicture.asset(
                            "assets/images/dots.svg",
                            color: Colors.white,
                          ),
                        )),
                    Positioned(
                      top: 165,
                      left: 179,
                      bottom: 165.5,
                      child: SvgPicture.asset(
                        'assets/images/play-circle.svg',
                        fit: BoxFit.fill,
                        width: 57.5,
                        height: 57.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 15, top: 11),
                  child: Text(
                    "Natasha, 24",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Regular",
                        color: Color(0xff2A2A2A)),
                  )),
              SizedBox(
                height: 7,
              ),
              Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    "Active 3 hours ago",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Regular",
                        color: Color(0xff2A2A2A)),
                  )),
              SizedBox(
                height: 7,
              ),
              Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    "Now about 500 meters away",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Regular",
                        color: Color(0xff2A2A2A)),
                  )),
              SizedBox(
                height: 9.5,
              ),
              Container(
                height: 1,
                width: 384,
                color: Color(0xffE4E4E4),
                margin: EdgeInsets.only(left: 15.5, right: 15.5),
              ),
              SizedBox(
                height: 11.5,
              ),
              Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    "Bio",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Medium",
                        color: Color(0xff2A2A2A)),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 15, top: 5),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    softWrap: true,
                    maxLines: 10,
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Regular",
                        color: Color(0xff717171)),
                  )),
              SizedBox(
                height: 9.5,
              ),
              Container(
                height: 1,
                width: 384,
                color: Color(0xffE4E4E4),
                margin: EdgeInsets.only(left: 15.5, right: 15.5),
              ),
              SizedBox(
                height: 14.5,
              ),
              Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    "My Cars",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Medium",
                        color: Color(0xff2A2A2A)),
                  )),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 52,
                width: 56,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.only(left: 15),
                child: Image.asset("assets/images/cars/BMW.png"),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  margin: EdgeInsets.only(
                    left: 28,
                  ),
                  child: Text(
                    "BMW",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Regular",
                        color: Color(0xff4B4B4B)),
                  )),
              SizedBox(
                height: 9.5,
              ),
              Container(
                height: 1,
                width: 384,
                color: Color(0xffE4E4E4),
                margin: EdgeInsets.only(left: 15.5, right: 15.5),
              ),
              SizedBox(
                height: 14.5,
              ),
              Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    "Your paths crossed:",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Medium",
                        color: Color(0xff2A2A2A)),
                  )),
              SizedBox(
                height: 11,
              ),
              Container(
                height: 109,
                width: 384,
                margin: EdgeInsets.only(left: 15.5, right: 15.5),
                color: Colors.white,
              ),
              SizedBox(
                height: 20.5,
              ),
              Container(
                height: 1,
                width: 384,
                color: Color(0xffE4E4E4),
                margin: EdgeInsets.only(left: 15.5, right: 15.5),
              ),
              SizedBox(
                height: 13.5,
              ),
              Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    "4 Mutual Clubs",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Medium",
                        color: Color(0xff2A2A2A)),
                  )),
              SizedBox(
                height: 13.5,
              ),
              Container(
                  height: 36,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xffD2D2D2), width: 1)),
                  margin: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/cars/Mercedes.png",
                        height: 36,
                        width: 39,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Mercedes Club",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Regular",
                            color: Color(0xff4B4B4B)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )),
              SizedBox(
                height: 35,
              )
            ],
          ),
        ),
        bottomNavigationBar: profileBottomBar(context, provider),
      );
    });
  }
}
