import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class MyAccountScreen extends StatefulWidget {
  MyAccountScreenState createState() => MyAccountScreenState();
}

class MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xffF9FFFF),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0xff00000029),
                offset: Offset(0, 0.0),
                blurRadius: 6.0,
              )
            ]),
            child: AppBar(
              elevation: 4,
              shadowColor: Color(0xff00000029),
              toolbarHeight: 53,
              leading: IconButton(
                iconSize: 25,
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => MyHomePage()));
                  // Navigator.of(context).push(PageRouteBuilder(
                  //     transitionDuration: const Duration(milliseconds: 400),
                  //     pageBuilder: (context, animation, secondaryAnimation) =>
                  //         MyHomePage(),
                  //     transitionsBuilder: (BuildContext context,
                  //         Animation<double> animation,
                  //         Animation<double> secondaryAnimation,
                  //         Widget child) {
                  //       return SlideTransition(
                  //         position: Tween<Offset>(
                  //           //Left to right
                  //           begin: const Offset(-1.0, 0.0),
                  //           end: Offset.zero,
                  //
                  //           //Right to left
                  //           // begin: const Offset(1.0, 0.0),
                  //           // end: Offset.zero,
                  //
                  //           //top to bottom
                  //           // begin: const Offset(0.0, -1.0),
                  //           // end: Offset.zero,
                  //
                  //           //   bottom to top
                  //           // begin: Offset(0.0, 1.0),
                  //           // end: Offset.zero,
                  //         ).animate(animation),
                  //         child: child,
                  //       );
                  //     }
                  //     // transitionsBuilder: (context, animation, secondaryAnimation, page) {
                  //     //   var begin = 0.0;
                  //     //   var end = 1.0;
                  //     //   var curve = Curves.ease;
                  //     //
                  //     //   var tween =
                  //     //   Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  //     //   return ScaleTransition(
                  //     //     scale: animation.drive(tween),
                  //     //     child: page,
                  //     //   );
                  //     // },
                  //     ));
                },
              ),
              centerTitle: false,
              title: Text(
                "My Account",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Medium",
                    color: Color(0xff313131)),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    showLogoutDialog(context, provider);
                  },
                  child: Container(
                    height: 18,
                    width: 18,
                    child: Image.asset("assets/images/edit.png"),
                  ),
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          ),
        ),
        body: provider.isLoading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: ColorTheme.themeCircularColor,
                  backgroundColor: ColorTheme.themeLightGrayColor,
                ))
            : SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Stack(
                      children: [
                        provider.image != null
                            ? Container(
                                margin: EdgeInsets.only(left: 150, right: 150),
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: Image.file(
                                    //to show image, you type like this.
                                    File(provider.image!.path),
                                    fit: BoxFit.cover,
                                  ).image,
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(left: 150, right: 150),
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(50),
                                // ),
                                // child: provider.isProfileEdit == true
                                //     ? CircleAvatar(
                                //         radius: 40,
                                //         backgroundImage: Image.network(provider
                                //                 .objProfileViewResponse
                                //                 .data!
                                //                 .profileImageUrl
                                //                 .toString())
                                //             .image,
                                //       )
                                child: Image.asset(
                                    "assets/images/profileImage.png"),
                              ),
                        Positioned(
                          left: 210,
                          right: 130,
                          top: 53,
                          child: Container(
                            height: 40,
                            width: 40,
                            child: IconButton(
                              icon: Image.asset(
                                "assets/images/editProfile.png",
                                height: 60,
                                width: 60,
                              ),
                              onPressed: () {
                                // provider.pickImages();

                                imageDialog(provider, context);
                                //Navigator.of(context).pushNamed('/profile');
                              },
                            ),
                            // decoration: BoxDecoration(
                            //   shape: BoxShape.circle,
                            //   color: Color(0xff0072C6),
                            // ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Text(
                        'About Me',
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
                        'Interested In Super Cars',
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
                        'Interested IN',
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
                        'Your added car',
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
                        'My Clubs',
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
                        'Subscription Plan',
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
                  ],
                ),
              ),
      );
    });
  }

  void imageDialog(PullUpLiveProvider provider, BuildContext context) {
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
                      //  provider.pickImages(ImageSource.gallery);
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
                      // provider.pickImages(ImageSource.camera);
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: provider.logoutClicked
                                ? ColorTheme.themeLightGrayColor
                                : Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            minimumSize: Size(80, 50),
                          ),
                          onPressed: () {
                            //provider.setlogoutDisableButton();
                            if (!provider.logoutClicked) {
                              provider.logoutClicked = true;
                              // provider.getLogoutApi(
                              //     Environment.loginMobileNumber, context);
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
}
