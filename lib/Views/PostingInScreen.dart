import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class PostingInScreen extends StatefulWidget {
  PostingInScreenState createState() => PostingInScreenState();
}

class PostingInScreenState extends State<PostingInScreen> {
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
            height: 900,
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
                        height: 33,
                        width: 33,
                        child: Image.asset("assets/images/profile.png"),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Container(
                          child: Text(
                        "Posting in",
                        style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      )),
                      SizedBox(
                        width: 11,
                      ),
                      Container(
                          width: 101,
                          height: 27,
                          padding: EdgeInsets.only(left: 10, right: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: Color(0xffFF4E00), width: 1)),
                          child: Row(
                            children: [
                              Text(
                                "My Feed",
                                style: TextStyle(
                                    color: Color(0xffFF4E00),
                                    fontSize: 14,
                                    fontFamily: "Regular"),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xffFF4E00),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 530,
                  decoration: BoxDecoration(color: Color(0xffF8F8F8)),
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write a message",
                        hintStyle: TextStyle(
                            color: Color(0xff535353),
                            fontFamily: "Light",
                            fontSize: 18)),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/media.png",
                        height: 28,
                        width: 34,
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text(
                        "Add Media",
                        style: TextStyle(
                            color: Color(0xff212121),
                            fontFamily: "Regular",
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                Container(
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
                        // Navigator.of(context)
                        //     .pushNamed('/createProfileStepTwo');
                      },
                      child: const Text(
                        'POST',
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
        ),
      );
    });
  }
}
