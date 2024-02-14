import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class ItemModel {
  String label;
  Color color;
  bool isSelected;

  ItemModel(this.label, this.color, this.isSelected);
}

class CreateClubScreen extends StatefulWidget {
  CreateClubScreenState createState() => CreateClubScreenState();
}

class CreateClubScreenState extends State<CreateClubScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
      //  provider.getCurrentPosition(context);
      provider.getCarListApi(context);
      provider.getSuperCarListApi(context);
    });
  }

  final List<ItemModel> _chipsList = [
    ItemModel("BMW", Color(0xffEEEEEE), false),
    ItemModel("Mercedes", Color(0xffEEEEEE), false),
    ItemModel("Audi", Color(0xffEEEEEE), false),
    ItemModel("Supercars", Color(0xffEEEEEE), false),
    ItemModel("4X4", Color(0xffEEEEEE), false),
  ];
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
                          child: Text(
                        "Create Club",
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
                  Stack(
                    children: [
                      Center(
                        child: provider.clubimage == null
                            ? Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  top: 79,
                                ),
                                height: 107,
                                width: 107,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xffFF6F00), width: 2)),
                                child: SvgPicture.asset(
                                  "assets/images/group.svg",
                                  height: 62,
                                  width: 62,
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  top: 79,
                                ),
                                height: 107,
                                width: 107,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: Image.file(
                                      provider.clubimage!,
                                      fit: BoxFit.cover,
                                      height: 107,
                                      width: 107,
                                    ).image),
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xffFF6F00), width: 2)),
                              ),
                      ),
                      Positioned(
                        left: 238,
                        right: 130,
                        top: 134,
                        child: Container(
                          height: 30,
                          width: 30,
                          child: IconButton(
                            icon: SvgPicture.asset(
                              "assets/images/edit.svg",
                              color: Colors.white,
                              height: 60,
                              width: 60,
                            ),
                            onPressed: () {
                              // provider.pickImages();

                              imageDialog(provider, context);

                              //  imageDialog(provider, context);
                              //Navigator.of(context).pushNamed('/profile');
                            },
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffFF6F00),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
                SizedBox(
                  height: 24,
                ),
                Container(
                    child: Text(
                  "Select Categories",
                  style: TextStyle(
                    fontFamily: "Medium",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                )),
                Wrap(
                  spacing: 2,
                  direction: Axis.horizontal,
                  children: filterChipsList(provider),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffBCBCBC)),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 17, left: 23, right: 18.5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: Color(0xff4B4B4B),
                            fontFamily: "Regular",
                            fontSize: 14),
                        hintText: "Name*"),
                  ),
                ),
                Container(
                  height: 107.5,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffBCBCBC)),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 17, left: 23, right: 18.5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
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
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    right: 15,
                    left: 15,
                  ),
                  height: 53,
                  width: 186,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.0),
                      color: Color(0xff6A6A6A)),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        //   provider.getCurrentPosition(context);
                        // Navigator.of(context)
                        //     .pushNamed('/createProfileStepTwo');
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/map-marker.svg",
                            height: 16,
                            width: 13.5,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'ADD LOCATION',
                            style: TextStyle(
                                color: ColorTheme.themeWhiteColor,
                                fontSize: 14,
                                fontFamily: "Regular"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
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
                        Navigator.of(context).pushNamed('/createEvent');
                      },
                      child: const Text(
                        'CREATE CLUB',
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

  List<Widget> filterChipsList(PullUpLiveProvider provider) {
    List<Widget> chips = [];
    for (int i = 0; i < provider.objCarListResponse.data.length; i++) {
      Widget item = Container(
        // margin: EdgeInsets.only(left: 5, top: 5, bottom: 5),
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          label: Text(provider.objCarListResponse.data[i].name),
          side: BorderSide(color: Color(0xffC7C7C7), width: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          labelStyle: const TextStyle(
              color: Color(0xff4B4B4B), fontSize: 14, fontFamily: "Regular"),
          backgroundColor: Colors.white,
          selected: provider.objCarListResponse.data[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              provider.objCarListResponse.data[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
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
                      provider.getClubImageFromGallery(ImageSource.gallery);
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
                      provider.getClubImageFromCamera(ImageSource.camera);
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
