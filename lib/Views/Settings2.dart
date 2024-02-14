import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class Settings2 extends StatefulWidget {
  Settings2State createState() => Settings2State();
}

class Settings2State extends State<Settings2> {
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
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff1F4FB2),
                  Color(0xffFF4E00),
                  Color(0xffFF4F00),
                ],
                stops: [0.2, 0.8, 0.2],
              ),
            ),
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
                          color: Colors.white,
                        )),
                    Container(
                        child: Text(
                      "Settings",
                      style: TextStyle(
                        fontFamily: "Medium",
                        fontSize: 19,
                        color: Color(0xffFFFFFF),
                      ),
                    )),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed('/settings');
                      },
                      child: Container(
                        height: 20,
                        width: 18.5,
                        child: SvgPicture.asset(
                          "assets/images/setting.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
                SizedBox(
                  height: 136,
                ),
                GestureDetector(
                  onTap: () {
                    provider.getSosApi(
                        provider.currentPosition!.latitude.toString(),
                        provider.currentPosition!.longitude.toString(),
                        context);
                  },
                  child: Container(
                    height: 317,
                    width: 374,
                    margin: EdgeInsets.only(left: 90, right: 90),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Opacity(
                              opacity: 0.20,
                              child: Container(
                                height: 254,
                                width: 254,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  // border color
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              bottom: 10,
                              left: 10,
                              right: 10,
                              child: Opacity(
                                opacity: 0.20,
                                child: Container(
                                  height: 232,
                                  width: 232,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    // border color
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              bottom: 20,
                              left: 20,
                              right: 20,
                              child: Container(
                                height: 190,
                                width: 190,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    "SOS",
                                    style: TextStyle(
                                        color: Color(
                                          0xffFC5202,
                                        ),
                                        fontFamily: "SemiBold",
                                        fontSize: 60),
                                  ),
                                ),
                                padding: EdgeInsets.all(14),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  margin: EdgeInsets.only(left: 42, right: 41),
                  child: Text(
                    "After pressing the SOS button, we will send\n           your current location to admin.",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Regular",
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
