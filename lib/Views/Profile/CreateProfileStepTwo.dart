import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';
import 'TsClip3.dart';

class ItemModel {
  String label;
  Color color;
  bool isSelected;

  ItemModel(this.label, this.color, this.isSelected);
}

class CreateProfileStepTwo extends StatefulWidget {
  CreateProfileStepTwoState createState() => CreateProfileStepTwoState();
}

class CreateProfileStepTwoState extends State<CreateProfileStepTwo> {
  final List<ItemModel> _chipsList = [
    ItemModel("Dating", Colors.white, false),
    ItemModel("Just Friend", Colors.white, false),
    ItemModel("Meeting", Colors.white, false),
    ItemModel("Marriage", Colors.white, false),
    ItemModel("Pullup Live events", Colors.white, false),
    ItemModel("Road Service", Colors.white, false),
    ItemModel("Car Clubs", Colors.white, false),
    ItemModel("Drifts", Colors.white, false),
    ItemModel("Off-road", Colors.white, false),
    ItemModel("Vintage Drive", Colors.white, false),
    ItemModel("Racing", Colors.white, false),
  ];
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
      provider.getInterestedInListApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xffF9FFFF),
        body: provider.isLoading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: ColorTheme.themeCircularColor,
                  backgroundColor: ColorTheme.themeLightGrayColor,
                ))
            : SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        // The containers in the background
                        Column(
                          children: <Widget>[
                            // ClipPath(
                            //   clipper: TsClip3(),
                            //   child:
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
                                      margin: EdgeInsets.only(
                                          top: 26.63, bottom: 19),
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
                            // ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
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
                        Container(
                          height: 627,
                          width: 384,
                          margin: EdgeInsets.only(
                              left: 15, right: 15, bottom: 19, top: 160),
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
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        top: 26.63, bottom: 19, left: 24),
                                    child: Text(
                                      "Step 2: Interested IN",
                                      style: TextStyle(
                                        fontFamily: "Medium",
                                        fontSize: 19,
                                        color: Color(0xff0054FF),
                                      ),
                                    )),
                                Wrap(
                                  spacing: 8,
                                  direction: Axis.horizontal,
                                  children: filterChipsList(provider),
                                ),
                                SizedBox(
                                  height: 200,
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed('/createProfile');
                                            },
                                            child: const Text(
                                              'PREV STEP',
                                              style: TextStyle(
                                                  color: ColorTheme
                                                      .themeWhiteColor,
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
                                          borderRadius:
                                              BorderRadius.circular(26.0),
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pushNamed(
                                                  '/createProfileStepThree');
                                            },
                                            child: const Text(
                                              'NEXT STEP',
                                              style: TextStyle(
                                                  color: ColorTheme
                                                      .themeWhiteColor,
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
                      ],
                    )
                  ],
                ),
              ),
      );
    });
  }

  List<Widget> filterChipsList(PullUpLiveProvider provider) {
    List<Widget> chips = [];
    for (int i = 0;
        i < provider.objInterestedInResponse.data.data.length;
        i++) {
      Widget item = Container(
        margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          label: Text(
              provider.objInterestedInResponse.data.data[i].name.toString()),
          side: BorderSide(color: Color(0xffB5B5B5), width: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          labelStyle: const TextStyle(
              color: Color(0xff4B4B4B), fontSize: 14, fontFamily: "Regular"),
          backgroundColor: Colors.white,
          selected: provider.objInterestedInResponse.data.data[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              provider.objInterestedInResponse.data.data[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
