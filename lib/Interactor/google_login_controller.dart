// import 'dart:convert';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:pull_up_live/Entity/Response/LoginResponse.dart';
// import 'package:http/http.dart' as http;
//
// import '../Utility/Environment.dart';
//
// class GoogleSignInController with ChangeNotifier {
//
//
//   GoogleSignIn _googleSignIn = GoogleSignIn();
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   bool isUserSignedIn = false;
//   GoogleSignInAccount? googleAccount;
//
//   //final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   var GOOGLE_CLIENT_DEV_KEY =
//       "294198152135-57bhgkkjhce1bjhomhpskat879ahpr33.apps.googleusercontent.com";
//
//   logout() async {
//     this.googleAccount = await _googleSignIn.signOut();
//     notifyListeners();
//   }
//
//   Future<User?> signInWithGoogle(BuildContext context) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     LoginResponse objLoginResponse =
//     LoginResponse(data: LoginData(accessToken: ''));
//     String loginUrl = Environment.baseUrl + Environment.loginUrl;
//     print("login url:${loginUrl}");
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//
//     final GoogleSignInAccount? googleSignInAccount =
//     await googleSignIn.signIn();
//
//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleAuth =
//       await googleSignInAccount.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       try {
//         final UserCredential userCredential =
//         await auth.signInWithCredential(credential);
//
//         user = userCredential.user;
//         print("google name:${user?.displayName}");
//         print("google email:${user?.email}");
//         print(
//             "google signIn accessToken:${userCredential.credential?.providerId}");
//         print("google signIn accessTokenId:${googleAuth.idToken}");
//         Map<String, String> loginParams = {
//           "user_type": "user",
//           "name": "${user?.displayName}",
//           "email": "${user?.email}",
//           "google_id": GOOGLE_CLIENT_DEV_KEY,
//         };
//         // final encoding = Encoding.getByName('utf-8');
//
//         print("login params:$loginParams");
//
//         final response = await http.post(
//           Uri.parse(loginUrl),
//           body: loginParams,
//           //encoding: encoding,
//         );
//
//         print("login body:${response.body}");
//
//         int statusCode = response.statusCode;
//         print("Login statusCode: ${response.statusCode}");
//
//         if (statusCode == 200) {
//           objLoginResponse = loginResponseFromJson(response.body);
//
//           Environment.accessToken = objLoginResponse.data.accessToken;
//           Environment.userName = objLoginResponse.data.name.toString();
//           print("Access token:${Environment.accessToken}");
//           print("User Name:${Environment.userName}");
//           Navigator.of(context).pushNamed('/createProfile');
//         } else if (statusCode == 422) {
//           // Fluttertoast.showToast(
//           //     msg: "The mobile number format is invalid.",
//           //     toastLength: Toast.LENGTH_SHORT,
//           //     gravity: ToastGravity.CENTER,
//           //     timeInSecForIosWeb: 1,
//           //     backgroundColor: Colors.red,
//           //     textColor: Colors.white,
//           //     fontSize: 16.0);
//         }
//
//         notifyListeners();
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           // handle the error here
//         } else if (e.code == 'invalid-credential') {
//           // handle the error here
//         }
//       } catch (e) {
//         // handle the error here
//       }
//     }
//
//     return user;
//   }
//
//   Future<User?> signInWithFacebook(BuildContext context) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     LoginResponse objLoginResponse =
//     LoginResponse(data: LoginData(accessToken: ''));
//     String loginUrl = Environment.baseUrl + Environment.loginUrl;
//     print("login url:${loginUrl}");
//     final _instance = FacebookAuth.instance;
//     final result = await _instance.login(permissions: ['public_profile']);
//
//     if (result.status == LoginStatus.success) {
//       final OAuthCredential credential =
//       FacebookAuthProvider.credential(result.accessToken!.token);
//
//       try {
//         final a = await auth.signInWithCredential(credential);
//
//         user = a.user;
//         print("facebook name:${user?.displayName}");
//         print("facebook email:${user?.email}");
//         print("google signIn accessToken:${a.credential?.providerId}");
//
//         Map<String, String> loginParams = {
//           "user_type": "user",
//           "name": "${user?.displayName}",
//           "email": "${user?.email}",
//           "facebook_id": GOOGLE_CLIENT_DEV_KEY,
//         };
//         // final encoding = Encoding.getByName('utf-8');
//
//         print("login params:$loginParams");
//
//         final response = await http.post(
//           Uri.parse(loginUrl),
//           body: loginParams,
//           //encoding: encoding,
//         );
//
//         print("login body:${response.body}");
//
//         int statusCode = response.statusCode;
//         print("Login statusCode: ${response.statusCode}");
//
//         if (statusCode == 200) {
//           objLoginResponse = loginResponseFromJson(response.body);
//
//           Environment.accessToken = objLoginResponse.data.accessToken;
//           print("Access token:${Environment.accessToken}");
//         } else if (statusCode == 422) {
//           // Fluttertoast.showToast(
//           //     msg: "The mobile number format is invalid.",
//           //     toastLength: Toast.LENGTH_SHORT,
//           //     gravity: ToastGravity.CENTER,
//           //     timeInSecForIosWeb: 1,
//           //     backgroundColor: Colors.red,
//           //     textColor: Colors.white,
//           //     fontSize: 16.0);
//         }
//
//         notifyListeners();
//
//         Navigator.of(context).pushNamed('/createProfile');
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           // handle the error here
//         } else if (e.code == 'invalid-credential') {
//           // handle the error here
//         }
//       } catch (e) {
//         // handle the error here
//       }
//     }
//
//     return user;
//   }
//
//   Future<String?> loginWithFacebook(BuildContext context) async {
//     try {
//       final _instance = FacebookAuth.instance;
//       final result =
//       await _instance.login(permissions: ['email', 'public_profile']);
//       if (result.status == LoginStatus.success) {
//         final OAuthCredential credential =
//         FacebookAuthProvider.credential(result.accessToken!.token);
//         final a = await _auth.signInWithCredential(credential);
//         print("Facebook email:${a.user?.email.toString()}");
//         print("Facebook name:${a.user?.displayName.toString()}");
//
//         await _instance.getUserData().then((userData) async {
//           await _auth.currentUser!.updateEmail(userData['email']);
//         });
//         return null;
//       } else if (result.status == LoginStatus.cancelled) {
//         return 'Login cancelled';
//       } else {
//         return 'Error';
//       }
//     } catch (e) {
//       return e.toString();
//     }
//   }
//
//   bool isLoggedIn = false;
//
//   void onLoginStatusChanged(bool isLoggedIn) {
//     //setState(() {
//     this.isLoggedIn = isLoggedIn;
//     notifyListeners();
//     // });
//   }
//
//   void initiateFacebookLogin(BuildContext context) async {
//     final facebookLogin = FacebookLogin();
//     final facebookLoginResult =
//     await facebookLogin.logIn(customPermissions: ['email']);
//
//     print(facebookLoginResult.accessToken);
//     print(facebookLoginResult.accessToken?.token);
//     print(facebookLoginResult.accessToken?.expires);
//     print(facebookLoginResult.accessToken?.permissions);
//     print(facebookLoginResult.accessToken?.userId);
//     //print(facebookLoginResult.accessToken?.isValid());
//
//     //print(facebookLoginResult.errorMessage);
//     print(facebookLoginResult.status);
//
//     final token = facebookLoginResult.accessToken?.token;
//
//     /// for profile details also use the below code
//     final graphResponse = await http.get(Uri.parse(
//         'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token'));
//     final profile = json.decode(graphResponse.body);
//     print(profile);
//     /*
//     from profile you will get the below params
//     {
//      "name": "Iiro Krankka",
//      "first_name": "Iiro",
//      "last_name": "Krankka",
//      "email": "iiro.krankka\u0040gmail.com",
//      "id": "<user id here>"
//     }
//    */
//   }
//
//
//
//
// }
