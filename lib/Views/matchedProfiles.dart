import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_up_live/Widgets/bottomNavBar.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class MatchedProfilesScreen extends StatefulWidget {
  MatchedProfilesScreenState createState() => MatchedProfilesScreenState();
}

class MatchedProfilesScreenState extends State<MatchedProfilesScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
      provider.getMatchedProfileApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Container(
            height: 28.47,
            width: 97,
            child: Image.asset("assets/images/pull-logo-2.png"),
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 9,
              ),
              Text(
                "Matched Profiles",
                style: TextStyle(
                    fontFamily: "Medium",
                    fontSize: 15,
                    color: Color(0xff2E2E2E)),
              ),
              SizedBox(
                height: 23,
              ),
              ListView.builder(
                  itemCount: provider.objMatchedProfileResponse.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var matchedProfileItems =
                        provider.objMatchedProfileResponse.data;
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('/matchedProfileDetails');
                      },
                      child: Card(
                        elevation: 1,
                        margin: EdgeInsets.only(left: 14, bottom: 8, right: 9),
                        child: Column(
                          children: [
                            Image.network(
                              // "assets/images/profile1.png",
                              "${matchedProfileItems[index].profileImageUrl}",
                              height: 245,
                              width: 191,
                            ),
                            Container(
                              height: 43,
                              width: 191,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(3),
                                      bottomRight: Radius.circular(3))),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                      child: Image.asset(
                                    "assets/images/Close_SM/drawable-hdpi/Close_SM.png",
                                    height: 12.22,
                                    width: 12.22,
                                  )),
                                  SizedBox(
                                    width: 31,
                                  ),
                                  Flexible(
                                      child: Icon(
                                    Icons.star,
                                    color: Color(0xff0CDAF2),
                                  )),
                                  SizedBox(
                                    width: 31,
                                  ),
                                  Flexible(
                                      child: SvgPicture.asset(
                                    "assets/images/heart.svg",
                                    height: 12.22,
                                    width: 12.22,
                                  )),
                                  SizedBox(
                                    width: 31,
                                  ),
                                  Flexible(
                                      child: SvgPicture.asset(
                                    "assets/images/Message.svg",
                                    height: 14.22,
                                    width: 14.22,
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
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
