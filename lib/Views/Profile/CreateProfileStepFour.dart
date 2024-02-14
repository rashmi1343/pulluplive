import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_pile/flutter_face_pile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';
import 'TsClip3.dart';

class CreateProfileStepFour extends StatefulWidget {
  CreateProfileStepFourState createState() => CreateProfileStepFourState();
}

class CreateProfileStepFourState extends State<CreateProfileStepFour> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xffF9FFFF),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  // The containers in the background
                  Column(
                    children: <Widget>[
                      //  ClipPath(
                      // clipper: TsClip3(),
                      //  child:
                      Container(
                        width: double.infinity,
                        height: 270,
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
                                  "Create Profile",
                                  style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 19,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      //  ),
                      Container(
                        height: MediaQuery.of(context).size.height,
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
                  Card(
                    elevation: 1,
                    margin: EdgeInsets.only(
                        left: 15, right: 15, bottom: 19, top: 160),
                    child: Container(
                      height: 627,
                      width: 384,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    top: 26.63, bottom: 19, left: 24),
                                child: Text(
                                  "Step 4: Pullup Clubs",
                                  style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 19,
                                    color: Color(0xff0054FF),
                                  ),
                                )),
                            Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(bottom: 19, left: 24),
                                child: Text(
                                  "Discover and join your favorite clubs",
                                  style: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 15,
                                    color: Color(0xff7D7D7D),
                                  ),
                                )),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5),
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 5),
                                  child: FilterChip(
                                    label: Text("All"),
                                    side: BorderSide(
                                        color: Color(0xffB5B5B5), width: 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelStyle: const TextStyle(
                                        color: Color(0xff4B4B4B),
                                        fontSize: 14,
                                        fontFamily: "Regular"),
                                    backgroundColor: Color(0xffEEEEEE),
                                    //  selected: _chipsList[i].isSelected,
                                    onSelected: (bool value) {
                                      setState(() {
                                        // _chipsList[i].isSelected = value;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5),
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 5),
                                  child: FilterChip(
                                    label: Text("Audi"),
                                    side: BorderSide(
                                        color: Color(0xffB5B5B5), width: 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelStyle: const TextStyle(
                                        color: Color(0xff4B4B4B),
                                        fontSize: 14,
                                        fontFamily: "Regular"),
                                    backgroundColor: Color(0xffEEEEEE),
                                    //  selected: _chipsList[i].isSelected,
                                    onSelected: (bool value) {
                                      setState(() {
                                        // _chipsList[i].isSelected = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Card(
                              elevation: 1,
                              margin: EdgeInsets.only(
                                  top: 22, left: 17, right: 18, bottom: 21),
                              color: Colors.white,
                              child: Container(
                                height: 260,
                                width: 182,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.topCenter,
                                          height: 150,
                                          child: Image.asset(
                                            "assets/images/profileFour.png",
                                            height: 110,
                                          ),
                                        ),
                                        Positioned(
                                            left: 2,
                                            top: 2,
                                            child: Image.asset(
                                              "assets/images/plus-circle.png",
                                              height: 20,
                                              width: 20,
                                            )),
                                        Positioned(
                                          top: 80,
                                          left: 65,
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 53,
                                                width: 53,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            43),
                                                    border: Border.all(
                                                        color:
                                                            Color(0xff65D80E),
                                                        width: 2)),
                                                child: CircleAvatar(
                                                  radius: 43,
                                                  backgroundImage: AssetImage(
                                                      'assets/images/discover.png'),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0.2,
                                                right: 0.1,
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: SvgPicture.asset(
                                                        "assets/images/green_tick.svg"),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      // margin: EdgeInsets.only(top: 10),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Audi Club",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Medium",
                                            color: Color(0xff3B3B3B)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FacePile(
                                      faces: [
                                        FaceHolder(
                                          id: '1',
                                          name: 'user 1',
                                          avatar: AssetImage(
                                              'assets/images/profile.png'),
                                        ),
                                        FaceHolder(
                                          id: '2',
                                          name: 'user 2',
                                          avatar: NetworkImage(
                                              'https://i.pravatar.cc/300?img=2'),
                                        ),
                                        FaceHolder(
                                          id: '3',
                                          name: 'user 3',
                                          avatar: NetworkImage(
                                              'https://i.pravatar.cc/300?img=3'),
                                        ),
                                      ],
                                      faceSize: 30,
                                      facePercentOverlap: .2,
                                      borderColor: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(right: 10),
                                            child: SvgPicture.asset(
                                                "assets/images/user.svg")),
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
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, left: 23, bottom: 24),
                                    height: 46,
                                    width: 141,
                                    decoration: BoxDecoration(
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
                                          Navigator.of(context).pushNamed(
                                              '/createProfileStepThree');
                                        },
                                        child: const Text(
                                          'PREV STEP',
                                          style: TextStyle(
                                              color: ColorTheme.themeWhiteColor,
                                              fontSize: 14,
                                              fontFamily: "Regular"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 16, bottom: 24),
                                    height: 46,
                                    width: 141,
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
                                          Navigator.of(context).pushNamed(
                                              '/createProfileStepFive');
                                        },
                                        child: const Text(
                                          'NEXT STEP',
                                          style: TextStyle(
                                              color: ColorTheme.themeWhiteColor,
                                              fontSize: 14,
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
