import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';

class PaySecurilyScreen extends StatefulWidget {
  PaySecurilyScreenState createState() => PaySecurilyScreenState();
}

class PaySecurilyScreenState extends State<PaySecurilyScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
                        "Pay Securely",
                        style: TextStyle(
                          fontFamily: "Regular",
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      )),
                    ],
                  ),
                ),
                Container(
                  height: 63,
                  color: Color(0xffFF4E00),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Premium Plan",
                                style: TextStyle(
                                    fontFamily: "Medium",
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              child: Text(
                                " Feb 5, 2021 9:00PM",
                                style: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                      fontFamily: "Medium",
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                TextSpan(
                                  text: '25.00',
                                  style: TextStyle(
                                      fontFamily: "Medium",
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 11),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/visa.png",
                        height: 20,
                        width: 50,
                      ),
                      SizedBox(
                        width: 26,
                      ),
                      Image.asset(
                        "assets/images/paypal.png",
                        height: 20,
                        width: 70,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "Card Number",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Medium",
                        color: Color(0xff727272)),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 83,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(1),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff00000014), //New
                                blurRadius: 25.0,
                              )
                            ],
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            color: Colors.white,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: 18,
                                    top: 15,
                                  ),
                                  hintText: "****",
                                  hintStyle: TextStyle(
                                      fontFamily: "Regular",
                                      fontSize: 20,
                                      color: Color(0xffA7A7A7))),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 83,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(1),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff00000014), //New
                                blurRadius: 25.0,
                              )
                            ],
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            color: Colors.white,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: 18,
                                    top: 15,
                                  ),
                                  hintText: "****",
                                  hintStyle: TextStyle(
                                      fontFamily: "Regular",
                                      fontSize: 20,
                                      color: Color(0xffA7A7A7))),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 83,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(1),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff00000014), //New
                                blurRadius: 25.0,
                              )
                            ],
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            color: Colors.white,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: 18,
                                    top: 15,
                                  ),
                                  hintText: "****",
                                  hintStyle: TextStyle(
                                      fontFamily: "Regular",
                                      fontSize: 20,
                                      color: Color(0xffA7A7A7))),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 83,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.circular(1),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff00000014), //New
                                blurRadius: 25.0,
                              )
                            ],
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            color: Colors.white,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    left: 18,
                                    top: 15,
                                  ),
                                  hintText: "****",
                                  hintStyle: TextStyle(
                                      fontFamily: "Regular",
                                      fontSize: 20,
                                      color: Color(0xffA7A7A7))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "Expiry Time",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Medium",
                        color: Color(0xff727272)),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: 179,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(1),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff00000014), //New
                              blurRadius: 25.0,
                            )
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          color: Colors.white,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 18, top: 15, bottom: 10),
                                hintText: "Month",
                                hintStyle: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 14,
                                    color: Color(0xffA7A7A7))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: 179,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(1),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff00000014), //New
                              blurRadius: 25.0,
                            )
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          color: Colors.white,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 18, top: 15, bottom: 10),
                                hintText: "Year",
                                hintStyle: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 14,
                                    color: Color(0xffA7A7A7))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "Card Holder",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Medium",
                        color: Color(0xff727272)),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: 384,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.circular(1),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff00000014), //New
                        blurRadius: 25.0,
                      )
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    color: Colors.white,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 18, top: 12, bottom: 12),
                          hintText: "Enter your name and surname",
                          hintStyle: TextStyle(
                              fontFamily: "Regular",
                              fontSize: 14,
                              color: Color(0xffA7A7A7))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "CVV",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Medium",
                        color: Color(0xff727272)),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: 182,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(1),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff00000014), //New
                              blurRadius: 25.0,
                            )
                          ],
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          color: Colors.white,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 18, top: 15, bottom: 10),
                                hintText: "***",
                                hintStyle: TextStyle(
                                    fontFamily: "Regular",
                                    fontSize: 14,
                                    color: Color(0xffA7A7A7))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: 150,
                        child: Text(
                          "This three digits on the back of the card.",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Regular",
                              color: Color(0xff727272)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 44,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 19,
                        width: 19,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          // borderRadius: BorderRadius.circular(1),
                          border: Border.all(
                              color: ColorTheme.themeLightGrayColor, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff00000014), //New
                              blurRadius: 25.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Container(
                        alignment: Alignment.center,
                        //height: 48,
                        // width: 150,
                        child: Text(
                          "Save information for future payments.",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Regular",
                              color: Color(0xff727272)),
                        ),
                      ),
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
                        'PROCESS PAYMENT',
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
