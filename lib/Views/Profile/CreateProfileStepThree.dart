import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:pull_up_live/Entity/Response/Car/CarListResponse.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';
import 'TsClip3.dart';

class CreateProfileStepThree extends StatefulWidget {
  CreateProfileStepThreeState createState() => CreateProfileStepThreeState();
}

class CreateProfileStepThreeState extends State<CreateProfileStepThree> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
      provider.getCarListApi(context);
      provider.getCarTransmissionApi(context);
    });
  }

  File? _carimage1;
  File? _carimage2;
  File? _carimage3;
  File? _carimage4;
  final picker1 = ImagePicker();
  final picker2 = ImagePicker();
  final picker3 = ImagePicker();
  final picker4 = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery1(ImageSource source) async {
    final pickedFile1 = await picker1.pickImage(source: source);

    setState(() {
      if (pickedFile1 != null) {
        _carimage1 = File(pickedFile1.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera1(ImageSource source) async {
    final pickedFile1 = await picker1.pickImage(source: source);

    setState(() {
      if (pickedFile1 != null) {
        _carimage1 = File(pickedFile1.path);
      }
    });
  }

  //Image Picker function to get image from gallery
  Future getImageFromGallery2(ImageSource source) async {
    final pickedFile2 = await picker2.pickImage(source: source);

    setState(() {
      if (pickedFile2 != null) {
        _carimage2 = File(pickedFile2.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera2(ImageSource source) async {
    final pickedFile2 = await picker2.pickImage(source: source);

    setState(() {
      if (pickedFile2 != null) {
        _carimage2 = File(pickedFile2.path);
      }
    });
  }

  //Image Picker function to get image from gallery
  Future getImageFromGallery3(ImageSource source) async {
    final pickedFile3 = await picker3.pickImage(source: source);

    setState(() {
      if (pickedFile3 != null) {
        _carimage3 = File(pickedFile3.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera3(ImageSource source) async {
    final pickedFile3 = await picker3.pickImage(source: source);

    setState(() {
      if (pickedFile3 != null) {
        _carimage3 = File(pickedFile3.path);
      }
    });
  }

  //Image Picker function to get image from gallery
  Future getImageFromGallery4(ImageSource source) async {
    final pickedFile4 = await picker4.pickImage(source: source);

    setState(() {
      if (pickedFile4 != null) {
        _carimage4 = File(pickedFile4.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera4(ImageSource source) async {
    final pickedFile4 = await picker4.pickImage(source: source);

    setState(() {
      if (pickedFile4 != null) {
        _carimage4 = File(pickedFile4.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  top: 26.63, bottom: 19, left: 24),
                              child: Text(
                                "Step 3: Add Your Car",
                                style: TextStyle(
                                  fontFamily: "Medium",
                                  fontSize: 19,
                                  color: Color(0xff0054FF),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 19, left: 24),
                              child: Text(
                                "Car Images",
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
                                child: _carimage1 == null
                                    ? Container(
                                        height: 66,
                                        width: 74,
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(top: 19, left: 24),
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
                                        margin:
                                            EdgeInsets.only(top: 19, left: 24),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: Image.file(
                                              _carimage1!,
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
                                child: _carimage2 == null
                                    ? Container(
                                        height: 66,
                                        width: 74,
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(top: 19, left: 10),
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
                                        margin:
                                            EdgeInsets.only(top: 19, left: 10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: Image.file(
                                              _carimage2!,
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
                                child: _carimage3 == null
                                    ? Container(
                                        height: 66,
                                        width: 74,
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(top: 19, left: 10),
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
                                        margin:
                                            EdgeInsets.only(top: 19, left: 10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: Image.file(
                                              _carimage3!,
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
                                child: _carimage4 == null
                                    ? Container(
                                        height: 66,
                                        width: 74,
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(top: 19, left: 10),
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
                                        margin:
                                            EdgeInsets.only(top: 19, left: 10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: Image.file(
                                              _carimage4!,
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
                            margin:
                                EdgeInsets.only(top: 17, left: 23, right: 18.5),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Color(0xff4B4B4B),
                                      fontFamily: "Regular",
                                      fontSize: 14),
                                  hintText: "Year"),
                            ),
                          ),
                          SizedBox(
                            height: 21.5,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 17, left: 23, right: 18.5),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: "Make",
                                hintStyle: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 14,
                                    color: Color(0xff4B4B4B)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select make of the car';
                                } else {
                                  return null;
                                }
                              },
                              items: provider.carDataList.map((item) {
                                return DropdownMenuItem(
                                  value: item.name,
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                        fontFamily: "Regular",
                                        fontSize: 14,
                                        color: Color(0xff4B4B4B)),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  provider.dropdownvalue = value!;
                                  print(
                                      "car selected:${provider.dropdownvalue}");
                                });
                                CarListData selectedCar = provider.carDataList
                                    .firstWhere(
                                        (element) => element.name == value);
                                int selectedCarId = selectedCar.id;
                                print("selectedCar Id:${selectedCarId}");
                                provider.getCarModelListApi(
                                    selectedCarId.toString(), context);
                              },
                              value: provider.dropdownvalue,
                            ),
                          ),
                          SizedBox(
                            height: 21.5,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 17, left: 23, right: 18.5),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: "Model",
                                hintStyle: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 14,
                                    color: Color(0xff4B4B4B)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select make of the car';
                                } else {
                                  return null;
                                }
                              },
                              items: provider.carModelDataList.map((item) {
                                return DropdownMenuItem(
                                  value: item.name,
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                        fontFamily: "Regular",
                                        fontSize: 14,
                                        color: Color(0xff4B4B4B)),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  provider.carModeldropdownvalue = value!;
                                  print(
                                      "car  model selected:${provider.carModeldropdownvalue}");
                                });
                              },
                              value: provider.carModeldropdownvalue,
                            ),
                          ),
                          SizedBox(
                            height: 21.5,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 17, left: 23, right: 18.5),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: "Transmission",
                                hintStyle: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 14,
                                    color: Color(0xff4B4B4B)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select transmission of the car';
                                } else {
                                  return null;
                                }
                              },
                              items: provider.carTransmissionList.map((item) {
                                return DropdownMenuItem(
                                  value: item.name,
                                  child: Text(
                                    item.name.toString(),
                                    style: TextStyle(
                                        fontFamily: "Regular",
                                        fontSize: 14,
                                        color: Color(0xff4B4B4B)),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  provider.transmissiondropdownvalue = value!;
                                  print(
                                      "car tranmission selected:${provider.transmissiondropdownvalue}");
                                });
                              },
                              value: provider.transmissiondropdownvalue,
                            ),
                          ),
                          SizedBox(
                            height: 21.5,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 17, left: 23, right: 18.5),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Color(0xff4B4B4B),
                                      fontFamily: "Regular",
                                      fontSize: 14),
                                  hintText: "Description"),
                            ),
                          ),
                          SizedBox(
                            height: 21.5,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 134,
                              height: 32,
                              margin: EdgeInsets.only(bottom: 20, left: 130),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xffFB4D00),
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(color: Color(0xffFB4D00))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      bottom: 4,
                                      top: 4,
                                    ),
                                    child: Text(
                                      "ADD",
                                      style: TextStyle(
                                          fontFamily: "Regular",
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 10, bottom: 5, right: 5, top: 5),
                                    height: 18,
                                    width: 18,
                                    child: SvgPicture.asset(
                                      "assets/images/plus-circle-orange.svg",
                                      color: Colors.white,
                                    ),
                                  )
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
                                      borderRadius: BorderRadius.circular(26.0),
                                      color: Color(0xff727272)),
                                  child: Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/createProfileStepTwo');
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
                                            '/createProfileStepFour');
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
                ],
              )
            ],
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
                      getImageFromGallery1(ImageSource.gallery);
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
                      getImageFromCamera1(ImageSource.camera);
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
                      getImageFromGallery2(ImageSource.gallery);
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
                      getImageFromCamera2(ImageSource.camera);
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
                      getImageFromGallery3(ImageSource.gallery);
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
                      getImageFromCamera3(ImageSource.camera);
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
                      getImageFromGallery4(ImageSource.gallery);
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
                      getImageFromCamera4(ImageSource.camera);
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
