import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:pull_up_live/Utility/Environment.dart';
import 'package:pull_up_live/Views/MyAccountScreen.dart';
import 'package:pull_up_live/Views/NotificationScreen.dart';
import 'package:pull_up_live/Views/Profile/CreateProfileStepTwo.dart';
import 'package:pull_up_live/Views/Settings.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';
import '../Settings2.dart';
import 'TsClip3.dart';

class CarListItems {
  String imagePath;
  String carName;

  CarListItems({
    required this.imagePath,
    required this.carName,
  });
}

class SuperCarListItems {
  String imagePath;
  String carName;

  SuperCarListItems({
    required this.imagePath,
    required this.carName,
  });
}

class CreateProfile extends StatefulWidget {
  CreateProfileState createState() => CreateProfileState();
}

class CreateProfileState extends State<CreateProfile> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
      provider.getCurrentPosition(context);
      provider.getCarListApi(context);
      provider.getSuperCarListApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        drawerEnableOpenDragGesture: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF9FFFF),
        body: provider.isLoading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: ColorTheme.themeCircularColor,
                  backgroundColor: ColorTheme.themeLightGrayColor,
                ))
            : Stack(
                children: <Widget>[
                  // The containers in the background
                  Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .35,
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
                      Container(
                        height: MediaQuery.of(context).size.height * .25,
                        color: Colors.white,
                      )
                    ],
                  ),
                  // The card widget with top padding,
                  // incase if you wanted bottom padding to work,
                  // set the `alignment` of container to Alignment.bottomCenter
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .28,
                        right: 20.0,
                        left: 20.0),
                    child: Container(
                      // height: 622,
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
                                  "Step 1: About me",
                                  style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 19,
                                    color: Color(0xff0054FF),
                                  ),
                                )),
                            Container(
                                margin: EdgeInsets.only(top: 19, left: 24),
                                child: Text(
                                  "Upload Images",
                                  style: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 14,
                                    color: Color(0xff4B4B4B),
                                  ),
                                )),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    imageDialog1(provider, context);
                                  },
                                  child: provider.image1 == null
                                      ? Container(
                                          height: 66,
                                          width: 74,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(
                                              top: 19, left: 24),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xffF3F3F3),
                                              )),
                                          child: Center(
                                            child: SvgPicture.asset(
                                                "assets/images/profile/camera.svg"),
                                          ))
                                      : Container(
                                          height: 66,
                                          width: 74,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(
                                              top: 19, left: 24),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: Image.file(
                                                provider.image1!,
                                                fit: BoxFit.cover,
                                              ).image),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xffF3F3F3),
                                              )),
                                        ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    imageDialog2(provider, context);
                                  },
                                  child: provider.image2 == null
                                      ? Container(
                                          height: 66,
                                          width: 74,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(
                                              top: 19, left: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xffF3F3F3),
                                              )),
                                          child: Center(
                                            child: SvgPicture.asset(
                                                "assets/images/profile/camera.svg"),
                                          ))
                                      : Container(
                                          height: 66,
                                          width: 74,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(
                                              top: 19, left: 10),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: Image.file(
                                                provider.image2!,
                                                fit: BoxFit.cover,
                                              ).image),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xffF3F3F3),
                                              )),
                                        ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    imageDialog3(provider, context);
                                  },
                                  child: provider.image3 == null
                                      ? Container(
                                          height: 66,
                                          width: 74,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(
                                              top: 19, left: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xffF3F3F3),
                                              )),
                                          child: Center(
                                            child: SvgPicture.asset(
                                                "assets/images/profile/camera.svg"),
                                          ))
                                      : Container(
                                          height: 66,
                                          width: 74,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(
                                              top: 19, left: 10),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: Image.file(
                                                provider.image3!,
                                                fit: BoxFit.cover,
                                              ).image),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xffF3F3F3),
                                              )),
                                        ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    imageDialog4(provider, context);
                                  },
                                  child: provider.image4 == null
                                      ? Container(
                                          height: 66,
                                          width: 74,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(
                                              top: 19, left: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xffF3F3F3),
                                              )),
                                          child: Center(
                                            child: SvgPicture.asset(
                                                "assets/images/profile/camera.svg"),
                                          ))
                                      : Container(
                                          height: 66,
                                          width: 74,
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(
                                              top: 19, left: 10),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: Image.file(
                                                provider.image4!,
                                                fit: BoxFit.cover,
                                              ).image),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xffF3F3F3),
                                              )),
                                        ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 17, left: 23, right: 18.5),
                              child: TextField(
                                controller: provider.profileNameController,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 2,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: Color(0xff4B4B4B),
                                        fontFamily: "Regular",
                                        fontSize: 14),
                                    hintText: "Name"),
                              ),
                            ),
                            SizedBox(
                              height: 21.5,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 17, left: 23, right: 18.5),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 10,
                                controller: provider.profileBioController,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: Color(0xff4B4B4B),
                                        fontFamily: "Regular",
                                        fontSize: 14),
                                    hintText: "Bio"),
                              ),
                            ),
                            SizedBox(
                              height: 21.5,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 17, left: 23, right: 18.5),
                              child: TextField(
                                controller: provider.profileInstaController,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 2,
                                decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        "assets/images/profile/insta.svg",
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Color(0xff4B4B4B),
                                        fontFamily: "Regular",
                                        fontSize: 14),
                                    hintText: "Instagram"),
                              ),
                            ),
                            SizedBox(
                              height: 21.5,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 17, left: 23, right: 18.5),
                              child: TextField(
                                controller: provider.profileYouTubeController,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 2,
                                decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                          "assets/images/profile/youtube.svg",
                                          height: 16,
                                          width: 16),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Color(0xff4B4B4B),
                                        fontFamily: "Regular",
                                        fontSize: 14),
                                    hintText: "Youtube Url"),
                              ),
                            ),
                            SizedBox(
                              height: 21.5,
                            ),
                            GestureDetector(
                              onTap: () {
                                ShowCarsDialog(context, provider);
                              },
                              child: Container(
                                height: 38,
                                width: 344,
                                margin: EdgeInsets.only(
                                    left: 23, right: 17, bottom: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffF3F3F3)),
                                child: Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 9, left: 14, bottom: 9),
                                        child: Text(
                                          "Interested in Cars",
                                          style: TextStyle(
                                            fontFamily: "Regular",
                                            fontSize: 14,
                                            color: Color(0xff4B4B4B),
                                          ),
                                        )),
                                    Spacer(),
                                    Container(
                                        height: 21,
                                        width: 20,
                                        margin: EdgeInsets.only(
                                            top: 9, bottom: 9, right: 12),
                                        child: SvgPicture.asset(
                                            "assets/images/profile/plus-circle.svg")),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                provider.isCarSelected == true
                                    ? Container(
                                        height: 30,
                                        width: 80,
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.only(
                                            left: 20, bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Color(0xffFFF6F6),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xffE32222),
                                                width: 1)),
                                        child: Center(
                                          child: Text(
                                            provider.carName,
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: "Regular",
                                                color: Color(0xffE32222)),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                provider.isSuperCarSelected == true
                                    ? Container(
                                        height: 30,
                                        width: 80,
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.only(
                                            left: 20, bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Color(0xffFFF6F6),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xffE32222),
                                                width: 1)),
                                        child: Center(
                                          child: Text(
                                            provider.superCarName,
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: "Regular",
                                                color: Color(0xffE32222)),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 19, left: 24),
                                child: Text(
                                  "Interested in",
                                  style: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 14,
                                    color: Color(0xff4B4B4B),
                                  ),
                                )),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 10, top: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: Color(0xffCECECE),
                                      ),
                                      backgroundColor:
                                          provider.selectedGenderType == "MALE"
                                              ? Color(0xffE32222)
                                              : Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(21),
                                      ),
                                      minimumSize: Size(101, 33),
                                    ),
                                    onPressed: () => provider
                                        .setSelectedGenderTypeText("MALE"),
                                    child: Text(
                                      'MALE',
                                      style: TextStyle(
                                          color: provider.selectedGenderType ==
                                                  "MALE"
                                              ? Colors.white
                                              : ColorTheme.themeBlackColor,
                                          fontSize: 14,
                                          fontFamily: "Regular"),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: Color(0xffCECECE),
                                      ),
                                      backgroundColor:
                                          provider.selectedGenderType ==
                                                  "FEMALE"
                                              ? Color(0xffE32222)
                                              : Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(21)),
                                      minimumSize: Size(101, 33),
                                    ),
                                    onPressed: () => provider
                                        .setSelectedGenderTypeText("FEMALE"),
                                    child: Text(
                                      'FEMALE',
                                      style: TextStyle(
                                          color: provider.selectedGenderType ==
                                                  "FEMALE"
                                              ? Colors.white
                                              : ColorTheme.themeBlackColor,
                                          fontSize: 14,
                                          fontFamily: "Regular"),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 8, top: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: Color(0xffCECECE),
                                      ),
                                      backgroundColor:
                                          provider.selectedGenderType == "OTHER"
                                              ? Color(0xffE32222)
                                              : Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(21)),
                                      minimumSize: Size(101, 33),
                                    ),
                                    onPressed: () => provider
                                        .setSelectedGenderTypeText("OTHER"),
                                    child: Text(
                                      'OTHER',
                                      style: TextStyle(
                                          color: provider.selectedGenderType ==
                                                  "OTHER"
                                              ? Colors.white
                                              : ColorTheme.themeBlackColor,
                                          fontSize: 14,
                                          fontFamily: "Regular"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     // Navigator.of(context)
                            //     //     .pushNamed('/createProfileStepTwo');
                            //   },
                            //   child: Container(
                            //     margin: EdgeInsets.only(
                            //         right: 19, left: 21, top: 14),
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceAround,
                            //       children: [
                            //         Container(
                            //           height: 33,
                            //           width: 80,
                            //           decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(21),
                            //               border: Border.all(
                            //                   color: Color(0xffCECECE),
                            //                   width: 1),
                            //               color: Colors.white),
                            //           child: Center(
                            //             child: Text(
                            //               "MALE",
                            //               style: TextStyle(
                            //                   fontSize: 14,
                            //                   fontFamily: "Regular"),
                            //             ),
                            //           ),
                            //         ),
                            //         Container(
                            //           height: 33,
                            //           width: 80,
                            //           decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(21),
                            //               border: Border.all(
                            //                   color: Color(0xffCECECE),
                            //                   width: 1),
                            //               color: Colors.white),
                            //           child: Center(
                            //             child: Text(
                            //               "FEMALE",
                            //               style: TextStyle(
                            //                   fontSize: 14,
                            //                   fontFamily: "Regular"),
                            //             ),
                            //           ),
                            //         ),
                            //         Container(
                            //           height: 33,
                            //           width: 80,
                            //           decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(21),
                            //               border: Border.all(
                            //                   color: Color(0xffCECECE),
                            //                   width: 1),
                            //               color: Colors.white),
                            //           child: Center(
                            //             child: Text(
                            //               "OTHER",
                            //               style: TextStyle(
                            //                   fontSize: 14,
                            //                   fontFamily: "Regular"),
                            //             ),
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 30,
                                left: 10,
                              ),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: provider.profileCheckBox,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        provider.profileCheckBox = value!;
                                      });
                                    },
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 9),
                                      child: Text(
                                        "Like we have for cars",
                                        style: TextStyle(
                                          fontFamily: "Regular",
                                          fontSize: 14,
                                          color: Color(0xff4B4B4B),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              margin: const EdgeInsets.only(
                                  right: 20, left: 204, top: 19, bottom: 25),
                              height: 46,
                              width: 161,
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
                                    provider.stepOneApi(
                                        provider.profileNameController.text,
                                        provider.profileBioController.text,
                                        provider.profileInstaController.text,
                                        provider.profileYouTubeController.text,
                                        provider.selectedGenderType,
                                        provider.carId.toString(),
                                        provider.supercarId.toString(),
                                        context);
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
                    ),
                  )
                ],
              ),
        // LayoutBuilder(
        //         builder: (context, constraints) => Column(
        //           children: [
        //             SizedBox(
        //                 height:
        //                     MediaQuery.of(context).size.height, //70 for bottom
        //                 child:
        //                 Stack(
        //                   children: <Widget>[
        //                     // The containers in the background
        //                     Column(
        //                       children: <Widget>[
        //                         ClipPath(
        //                           clipper: TsClip3(),
        //                           child: Container(
        //                             width: double.infinity,
        //                             height: 268,
        //                             decoration: BoxDecoration(
        //                               gradient: const LinearGradient(
        //                                 begin: Alignment.topCenter,
        //                                 end: Alignment.bottomCenter,
        //                                 colors: [
        //                                   Color(0xff1F4FB2),
        //                                   Color(0xffFF4F00),
        //                                 ],
        //                               ),
        //                             ),
        //                             child: Column(
        //                               children: [
        //                                 Container(
        //                                   height: 44.7,
        //                                   width: 155,
        //                                   margin: EdgeInsets.only(top: 55),
        //                                   child: Image.asset(
        //                                       "assets/images/splash/pull-logo.png"),
        //                                 ),
        //                                 Container(
        //                                     margin: EdgeInsets.only(
        //                                         top: 26.63, bottom: 19),
        //                                     child: Text(
        //                                       "Create Profile",
        //                                       style: TextStyle(
        //                                         fontFamily: "Medium",
        //                                         fontSize: 19,
        //                                         color: Color(0xffFFFFFF),
        //                                       ),
        //                                     ))
        //                               ],
        //                             ),
        //                           ),
        //                         ),
        //                         Container(
        //                           height: 480,
        //                           width: 384,
        //                           decoration: BoxDecoration(
        //                             color: Color(0xffF9FFFF),
        //                             boxShadow: [
        //                               BoxShadow(
        //                                 color: Color(0xff00000017),
        //                                 blurRadius: 10.0,
        //                                 spreadRadius: 2.0,
        //                               ), //BoxShadow
        //                             ],
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                     // The card widget with top padding,
        //                     // incase if you wanted bottom padding to work,
        //                     // set the `alignment` of container to Alignment.bottomCenter
        //                     Card(
        //                       elevation: 2,
        //                       margin: EdgeInsets.only(
        //                           left: 15, right: 15, bottom: 19, top: 160),
        //                       child: Container(
        //                         height: 622,
        //                         width: 384,
        //                         decoration: BoxDecoration(
        //                           color: Colors.white,
        //                           boxShadow: [
        //                             BoxShadow(
        //                               color: Color(0xff00000017),
        //                               blurRadius: 10.0,
        //                               spreadRadius: 2.0,
        //                             ), //BoxShadow
        //                           ],
        //                         ),
        //                         child: SingleChildScrollView(
        //                           child: Column(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               Container(
        //                                   alignment: Alignment.center,
        //                                   margin: EdgeInsets.only(
        //                                       top: 26.63, bottom: 19, left: 24),
        //                                   child: Text(
        //                                     "Step 1: About me",
        //                                     style: TextStyle(
        //                                       fontFamily: "Medium",
        //                                       fontSize: 19,
        //                                       color: Color(0xff0054FF),
        //                                     ),
        //                                   )),
        //                               Container(
        //                                   margin: EdgeInsets.only(
        //                                       top: 19, left: 24),
        //                                   child: Text(
        //                                     "Upload Images",
        //                                     style: TextStyle(
        //                                       fontFamily: "Regular",
        //                                       fontSize: 14,
        //                                       color: Color(0xff4B4B4B),
        //                                     ),
        //                                   )),
        //                               Row(
        //                                 children: [
        //                                   GestureDetector(
        //                                     onTap: () {
        //                                       imageDialog(provider, context);
        //                                     },
        //                                     child: _image == null
        //                                         ? Container(
        //                                             height: 66,
        //                                             width: 74,
        //                                             alignment:
        //                                                 Alignment.centerLeft,
        //                                             margin: EdgeInsets.only(
        //                                                 top: 19, left: 24),
        //                                             decoration: BoxDecoration(
        //                                                 borderRadius:
        //                                                     BorderRadius
        //                                                         .circular(8),
        //                                                 border: Border.all(
        //                                                   color:
        //                                                       Color(0xffF3F3F3),
        //                                                 )),
        //                                             child: Center(
        //                                               child: SvgPicture.asset(
        //                                                   "assets/images/profile/camera.svg"),
        //                                             ))
        //                                         : Container(
        //                                             height: 66,
        //                                             width: 74,
        //                                             alignment:
        //                                                 Alignment.centerLeft,
        //                                             // margin: EdgeInsets.only(
        //                                             //     top: 19, left: 24),
        //                                             decoration: BoxDecoration(
        //                                                 image: DecorationImage(
        //                                                     image: Image.file(
        //                                                   _image!,
        //                                                   fit: BoxFit.fill,
        //                                                 ).image),
        //                                                 borderRadius:
        //                                                     BorderRadius
        //                                                         .circular(8),
        //                                                 border: Border.all(
        //                                                   color:
        //                                                       Color(0xffF3F3F3),
        //                                                 )),
        //                                           ),
        //                                   ),
        //                                   Container(
        //                                       height: 66,
        //                                       width: 74,
        //                                       alignment: Alignment.centerLeft,
        //                                       margin: EdgeInsets.only(
        //                                           top: 19, left: 10),
        //                                       decoration: BoxDecoration(
        //                                           borderRadius:
        //                                               BorderRadius.circular(8),
        //                                           border: Border.all(
        //                                             color: Color(0xffF3F3F3),
        //                                           )),
        //                                       child: Center(
        //                                         child: SvgPicture.asset(
        //                                             "assets/images/profile/camera.svg"),
        //                                       )),
        //                                   Container(
        //                                       height: 66,
        //                                       width: 74,
        //                                       alignment: Alignment.centerLeft,
        //                                       margin: EdgeInsets.only(
        //                                           top: 19, left: 10),
        //                                       decoration: BoxDecoration(
        //                                           borderRadius:
        //                                               BorderRadius.circular(8),
        //                                           border: Border.all(
        //                                             color: Color(0xffF3F3F3),
        //                                           )),
        //                                       child: Center(
        //                                         child: SvgPicture.asset(
        //                                             "assets/images/profile/camera.svg"),
        //                                       )),
        //                                   Container(
        //                                       height: 66,
        //                                       width: 74,
        //                                       alignment: Alignment.centerLeft,
        //                                       margin: EdgeInsets.only(
        //                                           top: 19, left: 10),
        //                                       decoration: BoxDecoration(
        //                                           borderRadius:
        //                                               BorderRadius.circular(8),
        //                                           border: Border.all(
        //                                             color: Color(0xffF3F3F3),
        //                                           )),
        //                                       child: Center(
        //                                         child: SvgPicture.asset(
        //                                             "assets/images/profile/camera.svg"),
        //                                       )),
        //                                 ],
        //                               ),
        //                               Container(
        //                                 margin: EdgeInsets.only(
        //                                     top: 17, left: 23, right: 18.5),
        //                                 child: TextField(
        //                                   decoration: InputDecoration(
        //                                       hintStyle: TextStyle(
        //                                           color: Color(0xff4B4B4B),
        //                                           fontFamily: "Regular",
        //                                           fontSize: 14),
        //                                       hintText: "Name"),
        //                                 ),
        //                               ),
        //                               SizedBox(
        //                                 height: 21.5,
        //                               ),
        //                               Container(
        //                                 margin: EdgeInsets.only(
        //                                     top: 17, left: 23, right: 18.5),
        //                                 child: TextField(
        //                                   decoration: InputDecoration(
        //                                       hintStyle: TextStyle(
        //                                           color: Color(0xff4B4B4B),
        //                                           fontFamily: "Regular",
        //                                           fontSize: 14),
        //                                       hintText: "Bio"),
        //                                 ),
        //                               ),
        //                               SizedBox(
        //                                 height: 21.5,
        //                               ),
        //                               Container(
        //                                 margin: EdgeInsets.only(
        //                                     top: 17, left: 23, right: 18.5),
        //                                 child: TextField(
        //                                   decoration: InputDecoration(
        //                                       suffixIcon: Padding(
        //                                         padding:
        //                                             const EdgeInsets.all(12.0),
        //                                         child: SvgPicture.asset(
        //                                           "assets/images/profile/insta.svg",
        //                                           height: 16,
        //                                           width: 16,
        //                                         ),
        //                                       ),
        //                                       hintStyle: TextStyle(
        //                                           color: Color(0xff4B4B4B),
        //                                           fontFamily: "Regular",
        //                                           fontSize: 14),
        //                                       hintText: "Instagram"),
        //                                 ),
        //                               ),
        //                               SizedBox(
        //                                 height: 21.5,
        //                               ),
        //                               Container(
        //                                 margin: EdgeInsets.only(
        //                                     top: 17, left: 23, right: 18.5),
        //                                 child: TextField(
        //                                   decoration: InputDecoration(
        //                                       suffixIcon: Padding(
        //                                         padding:
        //                                             const EdgeInsets.all(12.0),
        //                                         child: SvgPicture.asset(
        //                                             "assets/images/profile/youtube.svg",
        //                                             height: 16,
        //                                             width: 16),
        //                                       ),
        //                                       hintStyle: TextStyle(
        //                                           color: Color(0xff4B4B4B),
        //                                           fontFamily: "Regular",
        //                                           fontSize: 14),
        //                                       hintText: "Youtube Url"),
        //                                 ),
        //                               ),
        //                               SizedBox(
        //                                 height: 21.5,
        //                               ),
        //                               GestureDetector(
        //                                 onTap: () {
        //                                   ShowCarsDialog(context, provider);
        //                                 },
        //                                 child: Container(
        //                                   height: 38,
        //                                   width: 344,
        //                                   margin: EdgeInsets.only(
        //                                       left: 23, right: 17, bottom: 15),
        //                                   decoration: BoxDecoration(
        //                                       borderRadius:
        //                                           BorderRadius.circular(5),
        //                                       color: Color(0xffF3F3F3)),
        //                                   child: Row(
        //                                     children: [
        //                                       Container(
        //                                           margin: EdgeInsets.only(
        //                                               top: 9,
        //                                               left: 14,
        //                                               bottom: 9),
        //                                           child: Text(
        //                                             "Interested in Cars",
        //                                             style: TextStyle(
        //                                               fontFamily: "Regular",
        //                                               fontSize: 14,
        //                                               color: Color(0xff4B4B4B),
        //                                             ),
        //                                           )),
        //                                       Spacer(),
        //                                       Container(
        //                                           height: 21,
        //                                           width: 20,
        //                                           margin: EdgeInsets.only(
        //                                               top: 9,
        //                                               bottom: 9,
        //                                               right: 12),
        //                                           child: SvgPicture.asset(
        //                                               "assets/images/profile/plus-circle.svg")),
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ),
        //                               provider.isCarSelected == true
        //                                   ? Container(
        //                                       height: 30,
        //                                       width: 80,
        //                                       padding: EdgeInsets.all(5),
        //                                       margin: EdgeInsets.only(
        //                                           left: 20, bottom: 10),
        //                                       decoration: BoxDecoration(
        //                                           color: Color(0xffFFF6F6),
        //                                           borderRadius:
        //                                               BorderRadius.circular(20),
        //                                           border: Border.all(
        //                                               color: Color(0xffE32222),
        //                                               width: 1)),
        //                                       child: Center(
        //                                         child: Text(
        //                                           provider.carName,
        //                                           style: TextStyle(
        //                                               fontSize: 11,
        //                                               fontFamily: "Regular",
        //                                               color: Color(0xffE32222)),
        //                                         ),
        //                                       ),
        //                                     )
        //                                   : Container(),
        //                               Container(
        //                                   margin: EdgeInsets.only(
        //                                       top: 19, left: 24),
        //                                   child: Text(
        //                                     "Interested in",
        //                                     style: TextStyle(
        //                                       fontFamily: "Regular",
        //                                       fontSize: 14,
        //                                       color: Color(0xff4B4B4B),
        //                                     ),
        //                                   )),
        //                               GestureDetector(
        //                                 onTap: () {
        //                                   // Navigator.of(context)
        //                                   //     .pushNamed('/createProfileStepTwo');
        //                                 },
        //                                 child: Container(
        //                                   margin: EdgeInsets.only(
        //                                       right: 19, left: 21, top: 14),
        //                                   child: Row(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment.spaceAround,
        //                                     children: [
        //                                       Container(
        //                                         height: 33,
        //                                         width: 80,
        //                                         decoration: BoxDecoration(
        //                                             borderRadius:
        //                                                 BorderRadius.circular(
        //                                                     21),
        //                                             border: Border.all(
        //                                                 color:
        //                                                     Color(0xffCECECE),
        //                                                 width: 1),
        //                                             color: Colors.white),
        //                                         child: Center(
        //                                           child: Text(
        //                                             "MALE",
        //                                             style: TextStyle(
        //                                                 fontSize: 14,
        //                                                 fontFamily: "Regular"),
        //                                           ),
        //                                         ),
        //                                       ),
        //                                       Container(
        //                                         height: 33,
        //                                         width: 80,
        //                                         decoration: BoxDecoration(
        //                                             borderRadius:
        //                                                 BorderRadius.circular(
        //                                                     21),
        //                                             border: Border.all(
        //                                                 color:
        //                                                     Color(0xffCECECE),
        //                                                 width: 1),
        //                                             color: Colors.white),
        //                                         child: Center(
        //                                           child: Text(
        //                                             "FEMALE",
        //                                             style: TextStyle(
        //                                                 fontSize: 14,
        //                                                 fontFamily: "Regular"),
        //                                           ),
        //                                         ),
        //                                       ),
        //                                       Container(
        //                                         height: 33,
        //                                         width: 80,
        //                                         decoration: BoxDecoration(
        //                                             borderRadius:
        //                                                 BorderRadius.circular(
        //                                                     21),
        //                                             border: Border.all(
        //                                                 color:
        //                                                     Color(0xffCECECE),
        //                                                 width: 1),
        //                                             color: Colors.white),
        //                                         child: Center(
        //                                           child: Text(
        //                                             "OTHER",
        //                                             style: TextStyle(
        //                                                 fontSize: 14,
        //                                                 fontFamily: "Regular"),
        //                                           ),
        //                                         ),
        //                                       )
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ),
        //                               Container(
        //                                 margin: EdgeInsets.only(
        //                                   top: 30,
        //                                   left: 10,
        //                                 ),
        //                                 child: Row(
        //                                   children: [
        //                                     Checkbox(
        //                                       value: provider.profileCheckBox,
        //                                       onChanged: (bool? value) {
        //                                         setState(() {
        //                                           provider.profileCheckBox =
        //                                               value!;
        //                                         });
        //                                       },
        //                                     ),
        //                                     Container(
        //                                         margin:
        //                                             EdgeInsets.only(left: 9),
        //                                         child: Text(
        //                                           "Like we have for cars",
        //                                           style: TextStyle(
        //                                             fontFamily: "Regular",
        //                                             fontSize: 14,
        //                                             color: Color(0xff4B4B4B),
        //                                           ),
        //                                         )),
        //                                   ],
        //                                 ),
        //                               ),
        //                               Container(
        //                                 alignment: Alignment.bottomRight,
        //                                 margin: const EdgeInsets.only(
        //                                     right: 20,
        //                                     left: 204,
        //                                     top: 19,
        //                                     bottom: 25),
        //                                 height: 46,
        //                                 width: 161,
        //                                 decoration: BoxDecoration(
        //                                   borderRadius:
        //                                       BorderRadius.circular(26.0),
        //                                   gradient: const LinearGradient(
        //                                     begin: Alignment.centerLeft,
        //                                     end: Alignment.centerRight,
        //                                     colors: [
        //                                       Color(0xff1F4FB2),
        //                                       Color(0xffFF4F00),
        //                                     ],
        //                                   ),
        //                                 ),
        //                                 child: Center(
        //                                   child: ElevatedButton(
        //                                     style: ElevatedButton.styleFrom(
        //                                       backgroundColor:
        //                                           Colors.transparent,
        //                                       shadowColor: Colors.transparent,
        //                                     ),
        //                                     onPressed: () {
        //                                       Navigator.of(context).push(
        //                                           PageRouteBuilder(
        //                                               transitionDuration:
        //                                                   const Duration(
        //                                                       milliseconds:
        //                                                           400),
        //                                               pageBuilder: (context,
        //                                                       animation,
        //                                                       secondaryAnimation) =>
        //                                                   CreateProfileStepTwo(),
        //                                               transitionsBuilder:
        //                                                   (BuildContext context,
        //                                                       Animation<double>
        //                                                           animation,
        //                                                       Animation<double>
        //                                                           secondaryAnimation,
        //                                                       Widget child) {
        //                                                 return new SlideTransition(
        //                                                   position:
        //                                                       new Tween<Offset>(
        //                                                     //Left to right
        //                                                     // begin: const Offset(
        //                                                     //     -1.0, 0.0),
        //                                                     // end: Offset.zero,
        //
        //                                                     //Right to left
        //                                                     begin: const Offset(
        //                                                         1.0, 0.0),
        //                                                     end: Offset.zero,
        //
        //                                                     //top to bottom
        //                                                     // begin: const Offset(0.0, -1.0),
        //                                                     // end: Offset.zero,
        //
        //                                                     //   bottom to top
        //                                                     // begin: Offset(0.0, 1.0),
        //                                                     // end: Offset.zero,
        //                                                   ).animate(animation),
        //                                                   child: child,
        //                                                 );
        //                                               }
        //                                               // transitionsBuilder: (context, animation, secondaryAnimation, page) {
        //                                               //   var begin = 0.0;
        //                                               //   var end = 1.0;
        //                                               //   var curve = Curves.ease;
        //                                               //
        //                                               //   var tween =
        //                                               //   Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        //                                               //   return ScaleTransition(
        //                                               //     scale: animation.drive(tween),
        //                                               //     child: page,
        //                                               //   );
        //                                               // },
        //                                               ));
        //                                     },
        //                                     child: const Text(
        //                                       'NEXT STEP',
        //                                       style: TextStyle(
        //                                           color: ColorTheme
        //                                               .themeWhiteColor,
        //                                           fontSize: 14,
        //                                           fontFamily: "Regular"),
        //                                     ),
        //                                   ),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //             ),
        //           ],
        //         ),
        //       ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    // The containers in the background
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 234.64,
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
                                  margin:
                                      EdgeInsets.only(top: 26.63, bottom: 19),
                                  child: Text(
                                    "Settings",
                                    style: TextStyle(
                                      fontFamily: "Medium",
                                      fontSize: 19,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          height: 200,
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
                    Container(
                      height: 422,
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
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        NotificationScreen(),
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return new SlideTransition(
                                        position: new Tween<Offset>(
                                          //Left to right
                                          // begin: const Offset(-1.0, 0.0),
                                          // end: Offset.zero,

                                          //Right to left
                                          begin: const Offset(1.0, 0.0),
                                          end: Offset.zero,

                                          //top to bottom
                                          // begin: const Offset(0.0, -1.0),
                                          // end: Offset.zero,

                                          //   bottom to top
                                          // begin: Offset(0.0, 1.0),
                                          // end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      );
                                    }));
                              },
                              title: Text(
                                'Notification management',
                                style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 15,
                                    color: Color(0xff4B4B4B)),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Color(0xff4B4B4B),
                              margin: EdgeInsets.only(left: 15, right: 20),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        Settings2(),
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return new SlideTransition(
                                        position: new Tween<Offset>(
                                          //Left to right
                                          // begin: const Offset(-1.0, 0.0),
                                          // end: Offset.zero,

                                          //Right to left
                                          begin: const Offset(1.0, 0.0),
                                          end: Offset.zero,

                                          //top to bottom
                                          // begin: const Offset(0.0, -1.0),
                                          // end: Offset.zero,

                                          //   bottom to top
                                          // begin: Offset(0.0, 1.0),
                                          // end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      );
                                    }));
                              },
                              title: Text(
                                'SOS',
                                style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 15,
                                    color: Color(0xff4B4B4B)),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Color(0xff4B4B4B),
                              margin: EdgeInsets.only(left: 15, right: 20),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 400),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        MyAccountScreen(),
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return new SlideTransition(
                                        position: new Tween<Offset>(
                                          //Left to right
                                          // begin: const Offset(-1.0, 0.0),
                                          // end: Offset.zero,

                                          //Right to left
                                          begin: const Offset(1.0, 0.0),
                                          end: Offset.zero,

                                          //top to bottom
                                          // begin: const Offset(0.0, -1.0),
                                          // end: Offset.zero,

                                          //   bottom to top
                                          // begin: Offset(0.0, 1.0),
                                          // end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      );
                                    }));
                              },
                              title: Text(
                                'My Account',
                                style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 15,
                                    color: Color(0xff4B4B4B)),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Color(0xff4B4B4B),
                              margin: EdgeInsets.only(left: 15, right: 20),
                            ),
                            ListTile(
                              title: Text(
                                'T & C',
                                style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 15,
                                    color: Color(0xff4B4B4B)),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Color(0xff4B4B4B),
                              margin: EdgeInsets.only(left: 15, right: 20),
                            ),
                            ListTile(
                              title: Text(
                                'My Subscriptions',
                                style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 15,
                                    color: Color(0xff4B4B4B)),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Color(0xff4B4B4B),
                              margin: EdgeInsets.only(left: 15, right: 20),
                            ),
                            ListTile(
                              title: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 15,
                                    color: Color(0xff4B4B4B)),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Color(0xff4B4B4B),
                              margin: EdgeInsets.only(left: 15, right: 20),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.of(context).pushNamed('/paySecurely');
                                showLogoutDialog(context, provider);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 20, top: 17.5),
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Medium",
                                      color: Color(0xffFF4F00)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  showLogoutDialog(BuildContext context, PullUpLiveProvider provider) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 220,
              width: 374,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xff707070), width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "SemiBold",
                          color: Color(0xff313131)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Do you Really want to logout?",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Medium",
                          color: Color(0xff111111)),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 15, top: 17),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorTheme.themeLightGrayColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            minimumSize: Size(80, 50),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                            // Navigator.of(context).pushNamed('/addVehicle');
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                color: ColorTheme.themeWhiteColor,
                                fontSize: 16,
                                fontFamily: "SemiBold"),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, bottom: 15, top: 17),
                        // child: MaterialButton(
                        //   onPressed: () {
                        //     // Navigator.of(context).pop();
                        //
                        //     // Navigator.of(context).pop();
                        //     if (!provider.logoutClicked) {
                        //       provider.logoutClicked = true;
                        //       provider.getLogoutApi(
                        //           Environment.loginMobileNumber, context);
                        //     }
                        //
                        //     //provider.setlogoutClickedEnableButton();
                        //     //  provider.setlogoutClickedDisableButton();
                        //     // Navigator.of(context).pushNamed('/addVehicle');
                        //   },
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(6.0)),
                        //   color: provider.logoutClicked
                        //       ? ColorTheme.themeLightGrayColor
                        //       : Colors.green,
                        //   disabledColor: ColorTheme.themeLightGrayColor,
                        //   height: 50,
                        //   minWidth: 80,
                        //   child: const Text(
                        //     'Logout',
                        //     style: TextStyle(
                        //         color: ColorTheme.themeWhiteColor,
                        //         fontSize: 16,
                        //         fontFamily: "SemiBold"),
                        //   ),
                        // ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),

                            backgroundColor: provider.logoutClicked
                                ? Colors.red
                                : Color(0xffFF4F00),
                            // provider.logoutClicked
                            //     ? Colors.red
                            //     : ColorTheme.themeLightGrayColor,

                            minimumSize: Size(80, 50),
                          ),
                          onPressed: () {
                            if (!provider.logoutClicked) {
                              provider.logoutClicked = true;
                              provider.getLogoutApi(context);
                            }
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(
                                color: ColorTheme.themeWhiteColor,
                                fontSize: 16,
                                fontFamily: "SemiBold"),
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

  ShowCarsDialog(BuildContext context, PullUpLiveProvider provider) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)), //this right here
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Container(
                // height: 524,
                width: 384,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff707070), width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 27),
                      child: const Text(
                        "Interested In Cars",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Regular",
                            color: Color(0xff4B4B4B)),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    GridView.builder(
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          // childAspectRatio: 0.55,
                        ),
                        shrinkWrap: true,
                        itemCount: provider.objCarListResponse.data.length,
                        itemBuilder: (ctx, i) {
                          var carListItems = provider.objCarListResponse.data;
                          final isSelected =
                              provider.selectedCarIndexs.contains(i);
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              provider.toggleCarSelected(
                                  i, carListItems[i].name);

                              // setState(() {
                              //   if (isSelected) {
                              //     provider.selectedCarIndexs.remove(i);
                              //   } else {
                              //     provider.selectedCarIndexs.add(i);
                              //   }
                              // });
                            },
                            child: Container(
                              width: 120,
                              height: 150,
                              child: Column(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 80,
                                    decoration: provider.selectedCarIndex == i
                                        ? BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  carListItems[i].image),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xffFB4D00)))
                                        : BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  carListItems[i].image),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xffCCCCCC),
                                                width: 2)),
                                  ),
                                  Text(
                                    carListItems[i].name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Regular",
                                        color: Color(0xff4B4B4B)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        showSuperCarsDialog(context, provider);
                      },
                      child: Container(
                        width: 134,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Color(0xffFB4D00))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 10,
                                bottom: 4,
                                top: 4,
                              ),
                              child: Text(
                                "Supercars",
                                style: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 16,
                                    color: Color(0xffFB4D00)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, bottom: 5, right: 5, top: 5),
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                  "assets/images/plus-circle-orange.svg"),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  showSuperCarsDialog(BuildContext context, PullUpLiveProvider provider) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)), //this right here
            child: SingleChildScrollView(
              child: Container(
                // height: 524,
                width: 384,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff707070), width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 27),
                      child: const Text(
                        "Interested In Super Cars",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Regular",
                            color: Color(0xff4B4B4B)),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    GridView.builder(
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          // childAspectRatio: 0.55,
                        ),
                        shrinkWrap: true,
                        itemCount: provider.objSuperCarResponse.data.length,
                        itemBuilder: (ctx, i) {
                          var superCarListItems =
                              provider.objSuperCarResponse.data;
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              provider.toggleSuperCarSelected(
                                  i, superCarListItems[i].name);
                            },
                            child: Container(
                              width: 120,
                              height: 150,
                              child: Column(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 80,
                                    decoration: provider
                                                .selectedSuperCarIndex ==
                                            i
                                        ? BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  superCarListItems[i].image),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xffFB4D00)))
                                        : BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  superCarListItems[i].image),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xffCCCCCC),
                                                width: 2)),
                                  ),
                                  Text(
                                    superCarListItems[i].name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Regular",
                                        color: Color(0xff4B4B4B)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void imageDialog1(PullUpLiveProvider provider, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'Please choose media to select',
              style: TextStyle(
                  fontSize: 15, fontFamily: "SemiBold", color: Colors.black),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      provider.getImageFromGallery1(ImageSource.gallery);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      provider.getImageFromCamera1(ImageSource.camera);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'From Camera',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: ColorTheme.themeLightGrayColor,
                    //   // shape: RoundedRectangleBorder(
                    //   //     borderRadius: BorderRadius.circular(6.0)),
                    //   // minimumSize: Size(374, 56),
                    // ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cancel),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void imageDialog2(PullUpLiveProvider provider, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'Please choose media to select',
              style: TextStyle(
                  fontSize: 15, fontFamily: "SemiBold", color: Colors.black),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      provider.getImageFromGallery2(ImageSource.gallery);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      provider.getImageFromCamera2(ImageSource.camera);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'From Camera',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: ColorTheme.themeLightGrayColor,
                    //   // shape: RoundedRectangleBorder(
                    //   //     borderRadius: BorderRadius.circular(6.0)),
                    //   // minimumSize: Size(374, 56),
                    // ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cancel),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void imageDialog3(PullUpLiveProvider provider, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'Please choose media to select',
              style: TextStyle(
                  fontSize: 15, fontFamily: "SemiBold", color: Colors.black),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      provider.getImageFromGallery3(ImageSource.gallery);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      provider.getImageFromCamera3(ImageSource.camera);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'From Camera',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: ColorTheme.themeLightGrayColor,
                    //   // shape: RoundedRectangleBorder(
                    //   //     borderRadius: BorderRadius.circular(6.0)),
                    //   // minimumSize: Size(374, 56),
                    // ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cancel),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void imageDialog4(PullUpLiveProvider provider, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'Please choose media to select',
              style: TextStyle(
                  fontSize: 15, fontFamily: "SemiBold", color: Colors.black),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      provider.getImageFromGallery4(ImageSource.gallery);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'From Gallery',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      provider.getImageFromCamera4(ImageSource.camera);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'From Camera',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: ColorTheme.themeLightGrayColor,
                    //   // shape: RoundedRectangleBorder(
                    //   //     borderRadius: BorderRadius.circular(6.0)),
                    //   // minimumSize: Size(374, 56),
                    // ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cancel),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Medium",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
