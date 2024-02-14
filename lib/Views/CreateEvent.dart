import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class CreateEventScreen extends StatefulWidget {
  CreateEventScreenState createState() => CreateEventScreenState();
}

class CreateEventScreenState extends State<CreateEventScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
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
                physics: ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
                              child: Text(
                            "Create Event",
                            style: TextStyle(
                              fontFamily: "Medium",
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          )),
                        ],
                      ),
                    ),
                    Stack(children: [
                      Container(
                        height: 223,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff1058a7),
                              Color(0xff0a3d87),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 19),
                        child: Row(
                          children: [
                            Container(
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset("assets/images/profile.png"),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Hosting in ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Medium",
                                        color: Colors.white),
                                  ),
                                  TextSpan(
                                      text: 'public events',
                                      style: TextStyle(
                                          fontFamily: "Medium",
                                          fontSize: 16,
                                          color: Color(0xffFF6F00))),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            imageDialog(provider, context);
                          },
                          child: provider.eventimage == null
                              ? Container(
                                  height: 107,
                                  width: 107,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    top: 79,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xffF3F3F3),
                                      )),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/profile/camera.svg",
                                      height: 39.9,
                                      width: 39.9,
                                    ),
                                  ))
                              : Container(
                                  height: 107,
                                  width: 107,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                    top: 79,
                                  ),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: Image.file(
                                        provider.eventimage!,
                                        fit: BoxFit.cover,
                                        height: 107,
                                        width: 107,
                                      ).image),
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xffF3F3F3),
                                      )),
                                ),
                        ),
                      ),
                    ]),
                    Container(
                      margin: EdgeInsets.only(top: 17, left: 23, right: 18.5),
                      child: TextField(
                        controller: provider.createEventNameController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Color(0xff4B4B4B),
                                fontFamily: "Regular",
                                fontSize: 14),
                            hintText: "Name*"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 17, left: 23, right: 18.5),
                      child: TextField(
                        controller: provider.createEventDescController,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Color(0xff4B4B4B),
                                fontFamily: "Regular",
                                fontSize: 14),
                            hintText: "Description*"),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 181,
                      width: double.infinity,
                      child: GoogleMap(
                        //Map widget from google_maps_flutter package
                        zoomGesturesEnabled: true, //enable Zoom in, out on map
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(provider.currentPosition!.latitude,
                              provider.currentPosition!.longitude),
                          zoom: 11.0,
                        ),

                        mapType: MapType.normal, //map type
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 17),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/clock-circle.svg",
                            height: 16,
                            width: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "All-day",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Regular",
                                color: Color(0xff141414)),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            "assets/images/toggle-off.svg",
                            height: 12,
                            width: 14,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 17),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/Calendar_Check.svg",
                            height: 16,
                            width: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.selectStartDate(context);
                            },
                            child: Text(
                              "Start Date",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Regular",
                                  color: Color(0xff141414)),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              provider.selectStartTime(context);
                            },
                            child: Text(
                              "Start Time",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Regular",
                                  color: Color(0xff141414)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 17),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/Calendar_Check.svg",
                            height: 16,
                            width: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.selectEndDate(context);
                            },
                            child: Text(
                              "End Date",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Regular",
                                  color: Color(0xff141414)),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              provider.selectEndTime(context);
                            },
                            child: Text(
                              "End Time",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Regular",
                                  color: Color(0xff141414)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(
                          right: 15, left: 15, bottom: 20),
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
                            provider.getCreateEventApi(
                                provider.createEventNameController.text,
                                provider.createEventDescController.text,
                                provider.currentPosition!.latitude.toString(),
                                provider.currentPosition!.longitude.toString(),
                                provider.currentAddress.toString(),
                                provider.eventStartDate,
                                provider.eventStartTime,
                                provider.eventEndDate,
                                provider.eventEndTime,
                                context);
                            // Navigator.of(context).pushNamed('/settings2');
                          },
                          child: const Text(
                            'CREATE NOW',
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
                      provider.getImageFromGallery(ImageSource.gallery);
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
                      provider.getImageFromCamera(ImageSource.camera);
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
