import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class ItemModel {
  String label;
  Color color;
  bool isSelected;

  ItemModel(this.label, this.color, this.isSelected);
}

class JoinClubScreen extends StatefulWidget {
  JoinClubScreenState createState() => JoinClubScreenState();
}

class JoinClubScreenState extends State<JoinClubScreen> {
  final List<ItemModel> _chipsList = [
    ItemModel("Mercedes", Color(0xffB5B5B5), false),
    ItemModel("BMW", Color(0xffB5B5B5), false),
    ItemModel("Audi", Color(0xffB5B5B5), false),
    ItemModel("SuperCars", Color(0xffB5B5B5), false),
    ItemModel("Drift", Color(0xffB5B5B5), false),
    ItemModel("Vintage", Color(0xffB5B5B5), false),
    ItemModel("Racing", Color(0xffB5B5B5), false),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Container(
            color: Colors.transparent,
            height: 28.47,
            width: 97,
            child: Image.asset("assets/images/pull-logo-2.png"),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: SvgPicture.asset("assets/images/dots.svg"),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 241,
                margin: EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/map2.png"))),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 241,
                      child: SvgPicture.asset("assets/images/map.svg"),
                    ),
                    Positioned(
                      top: 30,
                      child: Stack(
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(130),
                                border: Border.all(
                                    color: Color(0xff65D80E), width: 2)),
                            child: CircleAvatar(
                              radius: 130,
                              backgroundImage:
                                  AssetImage('assets/images/discover.png'),
                            ),
                          ),
                          Positioned(
                            top: 1,
                            left: 80,
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child:
                                    SvgPicture.asset("assets/images/chat.svg"),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 80,
                            left: 114,
                            child: Container(
                              height: 18,
                              width: 18,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SvgPicture.asset(
                                    "assets/images/green_tick.svg"),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            left: 20,
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 89,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Color(0xffDFDFDF), width: 0.5),
                                  color: Color(0xffFFFFFF)),
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                    fontFamily: "SemiBold",
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 160,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 8),
                                child: Text(
                                  "9.3K",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: "SemiBold",
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 8),
                                child: Text(
                                  "Followers",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Regular",
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 8),
                            child: Text(
                              "Audi Club",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "SemiBold",
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 8),
                                child: Text(
                                  "51",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: "SemiBold",
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 8),
                                child: Text(
                                  "Following",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Regular",
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Container(
                margin: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Medium",
                          color: Color(0xff444444)),
                    ),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Medium",
                          color: Color(0xffFF6F00)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 15,
                  left: 15,
                ),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Regular",
                      color: Color(0xff393939)),
                ),
              ),
              Container(
                height: 1,
                color: Color(0xffE4E4E4),
                margin: EdgeInsets.only(top: 20),
              ),
              Container(
                margin:
                    EdgeInsets.only(right: 15, left: 15, bottom: 10, top: 20),
                child: Row(
                  children: [
                    Text(
                      "Feeds",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Medium",
                          color: Color(0xff444444)),
                    ),
                    Spacer(),
                    Text(
                      "View all",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Medium",
                          color: Color(0xffFF6F00)),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 1,
                margin:
                    EdgeInsets.only(top: 22, left: 15, right: 13, bottom: 39.5),
                color: Colors.white,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 273,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 110,
                        width: 200,
                        child: Image.asset("assets/images/joinclub.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          "Lorem Ipsum is simply Dummy text of the printing and typesetting industry.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Regular",
                              color: Color(0xff3B3B3B)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5, top: 10, right: 5),
                            child: Stack(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: Color(0xff65D80E), width: 2)),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage('assets/images/audi.png'),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0.2,
                                  left: 20,
                                  child: Container(
                                    height: 12,
                                    width: 12,
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
                            margin: EdgeInsets.only(top: 8),
                            alignment: Alignment.center,
                            child: Text(
                              "Audi Club",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Medium",
                                  color: Color(0xff3B3B3B)),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 8),
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff0054FF),
                            ),
                            padding: EdgeInsets.all(5),
                            child: SvgPicture.asset(
                                "assets/images/like-solid.svg"),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 8, right: 5, top: 8),
                            child: Text(
                              "23",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Regular",
                                  color: Color(0xff444444)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Color(0xffE4E4E4),
                margin: EdgeInsets.only(top: 20),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 20),
                child: Text(
                  "Categories",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Medium",
                      color: Color(0xff393939)),
                ),
              ),
              Wrap(
                spacing: 8,
                direction: Axis.horizontal,
                children: filterChipsList(),
              ),
              Container(
                height: 1,
                color: Color(0xffE4E4E4),
                margin: EdgeInsets.only(
                  top: 20,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 20),
                child: Text(
                  "Cars",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Medium",
                      color: Color(0xff393939)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 76,
                    width: 83,
                    margin: EdgeInsets.only(left: 15),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Image.asset("assets/images/audi.png"),
                  ),
                  Text(
                    "Audi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Regular",
                        color: Color(0xff4B4B4B)),
                  ),
                ],
              ),
              Container(
                height: 1,
                color: Color(0xffE4E4E4),
                margin: EdgeInsets.only(
                  top: 20,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 20),
                child: Text(
                  "Events",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Medium",
                      color: Color(0xff393939)),
                ),
              ),
              Container(
                  height: 210,
                  width: 351,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/joinclub2.png',
                        fit: BoxFit.cover,
                        width: 374,
                        height: 194,
                      ),
                      Positioned(
                          top: 120,
                          left: 30,
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  color: Color(0xff0054FF),
                                  child: Column(
                                    children: [
                                      Text(
                                        "31",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: "SemiBold",
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Jan",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Regular",
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dummy Event Name",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "SemiBold",
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Florida, USA",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Regular",
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "60 Attending",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: "Regular",
                                          color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> filterChipsList() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Container(
        margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          label: Text(_chipsList[i].label),
          side: BorderSide(color: Color(0xffB5B5B5), width: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          labelStyle: const TextStyle(
              color: Colors.white, fontSize: 14, fontFamily: "Regular"),
          backgroundColor: _chipsList[i].color,
          selected: _chipsList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
