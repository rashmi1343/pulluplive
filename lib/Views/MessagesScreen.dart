import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_up_live/Widgets/bottomNavBar.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class MessagesScreen extends StatefulWidget {
  MessagesScreenState createState() => MessagesScreenState();
}

class MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 1,
        ),
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
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
                        margin: EdgeInsets.only(left: 100),
                        alignment: Alignment.center,
                        child: Text(
                          "Messages",
                          style: TextStyle(
                              fontFamily: "Regular",
                              fontSize: 22,
                              color: Color(0xff2E2E2E)),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: SvgPicture.asset(
                          "assets/images/search.svg",
                          color: Colors.black,
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: 384,
                  color: Color(0xffE4E4E4),
                  margin: EdgeInsets.only(left: 15.5, right: 15.5),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "New Match",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Regular",
                          color: Color(0xff2A2A2A)),
                    )),
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Image.asset(
                    "assets/images/Ellipse 10.png",
                    height: 69,
                    width: 69,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: 30,
                    ),
                    child: Text(
                      "Erica",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Medium",
                          color: Colors.black),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  width: 384,
                  color: Color(0xffE4E4E4),
                  margin: EdgeInsets.only(left: 15.5, right: 15.5),
                ),
                Container(
                    margin: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "Messages",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Regular",
                          color: Color(0xffFF4E00)),
                    )),
                SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/messageDetailScreen');
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                "assets/images/Ellipse 10.png",
                                height: 69,
                                width: 69,
                              ),
                            ),
                            Positioned(
                              left: 57,
                              top: 45,
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  color: Color(0xff32C50F),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Text(
                                  "Kathie",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Regular",
                                      color: Colors.black),
                                )),
                                Container(
                                    margin: EdgeInsets.only(left: 200),
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: Color(0xff144FBB),
                                        shape: BoxShape.circle),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Regular",
                                          color: Colors.white),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                    child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'You: ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Regular",
                                            color: Color(0xff5582DC)),
                                      ),
                                      TextSpan(
                                        text: 'I need help',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Regular",
                                            color: Color(0xff828282)),
                                      ),
                                    ],
                                  ),
                                )),
                                Container(
                                    margin: EdgeInsets.only(left: 120),
                                    child: Text(
                                      "9:13 pm",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Regular",
                                          color: Color(0xff828282)),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 1,
                              width: 284,
                              color: Color(0xffE4E4E4),
                              margin: EdgeInsets.only(right: 15.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
