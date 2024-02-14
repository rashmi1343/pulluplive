import 'dart:convert';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_up_live/Interactor/google_login_controller.dart';
import 'package:pull_up_live/Presenter/PullUpLiveProvider.dart';

import '../../Utility/ColorTheme.dart';
import '../Profile/CreateProfile.dart';

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _isLoggedIn = false;
  Map _userObj = {};
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FacebookLogin fbLogin = new FacebookLogin();
  bool isFacebookLoginIn = false;
  String errorMessage = '';
  String successMessage = '';

  String _phone = "";

  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login/login_bg.png"),
              fit: BoxFit.cover,
            ),
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
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 52.51,
                    width: 183,
                    margin: const EdgeInsets.only(
                        left: 116, right: 115, top: 55, bottom: 628.49),
                    child: Image.asset("assets/images/splash/pull-logo.png"),
                  ),
                  Positioned(
                    top: 630,
                    child: Container(
                      height: 28,
                      margin: EdgeInsets.only(
                        left: 110,
                        right: 107,
                      ),
                      child: Text(
                        "Login / Registration",
                        style: TextStyle(
                            fontFamily: "SemiBold",
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 680,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).pushNamed('/createProfile');
                            //  provider.initiateFacebookLogin(context);
                            // provider.signInWithFacebook(context);
                            // FacebookAuth.instance.login(permissions: [
                            //   "public_profile",
                            //   "email"
                            // ]).then((value) {
                            //   FacebookAuth.instance
                            //       .getUserData()
                            //       .then((userData) {
                            //     setState(() {
                            //       provider.isLoggedIn = true;
                            //       provider.userObj = userData;
                            //     });
                            //   });
                            // });
                          },
                          child: Container(
                            height: 46,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff3B5998)),
                            margin: const EdgeInsets.only(
                                left: 36, right: 22, bottom: 43),
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  SvgPicture.asset(
                                    "assets/images/login/facebook-f.svg",
                                    height: 25,
                                    width: 25,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "FACEBOOK",
                                    style: TextStyle(
                                        fontFamily: "Regular",
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //  Navigator.of(context).pushNamed('/matchedProfiles');
                            provider.signInWithGoogle(context);
                          },
                          child: Container(
                            height: 46,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xffDB4437)),
                            margin: const EdgeInsets.only(
                                left: 36, right: 30, bottom: 43),
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SvgPicture.asset(
                                    "assets/images/login/google_logo.svg",
                                    height: 25,
                                    width: 25,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "GOOGLE",
                                    style: TextStyle(
                                        fontFamily: "Regular",
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
    });
  }

  void signInWithFacebook() async {
    FacebookAuth.instance
        .login(permissions: ["public_profile", "email"]).then((value) {
      FacebookAuth.instance.getUserData().then((result) {
        setState(() {
          _isLoggedIn = true;
          _userObj = result;
        });
      });

      //   try {
      //     final LoginResult result = await FacebookAuth.instance
      //         .login(permissions: (['email', 'public_profile']));
      //     final token = result.accessToken!.token;
      //     print(
      //         'Facebook token userID : ${result.accessToken!.grantedPermissions}');
      //     final graphResponse = await http.get(Uri.parse(
      //         'https://graph.facebook.com/'
      //         'v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
      //
      //     final profile = jsonDecode(graphResponse.body);
      //     print("Profile is equal to $profile");
      //     try {
      //       final AuthCredential facebookCredential =
      //           FacebookAuthProvider.credential(result.accessToken!.token);
      //       final userCredential = await FirebaseAuth.instance
      //           .signInWithCredential(facebookCredential);
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => CreateProfile()),
      //       );
      //     } catch (e) {
      //       final snackBar = SnackBar(
      //         margin: const EdgeInsets.all(20),
      //         behavior: SnackBarBehavior.floating,
      //         content: Text(e.toString()),
      //         backgroundColor: (Colors.redAccent),
      //         action: SnackBarAction(
      //           label: 'dismiss',
      //           onPressed: () {},
      //         ),
      //       );
      //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //     }
      //   } catch (e) {
      //     print("error occurred");
      //     print(e.toString());
      //   }
      // }
    });
  }
}
