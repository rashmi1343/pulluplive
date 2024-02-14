import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_up_live/Views/JoinClubScreen.dart';
import 'package:pull_up_live/Views/MessageDetail.dart';
import 'package:pull_up_live/Views/NotificationScreen.dart';
import 'package:pull_up_live/Views/PaySecurily.dart';
import 'package:pull_up_live/Views/PostingInScreen.dart';
import 'package:pull_up_live/Views/Profile/CreateProfile.dart';
import 'package:pull_up_live/Views/Profile/CreateProfileStepThree.dart';
import 'package:pull_up_live/Views/ScreenNo25.dart';
import 'package:pull_up_live/Views/Settings2.dart';
import 'package:pull_up_live/Views/matchedProfiles.dart';
import 'package:pull_up_live/Interactor/google_login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Presenter/PullUpLiveProvider.dart';
import 'Router/AppRoutes.dart';
import 'Router/Routes.dart';
import 'Views/Celebration.dart';
import 'Views/CreateClub.dart';
import 'Views/CreateEvent.dart';
import 'Views/Following/DiscoverScreen.dart';
import 'Views/InterestedInScreen.dart';
import 'Views/MatchedProfileDetails.dart';
import 'Views/MessagesScreen.dart';
import 'Views/MyAccountScreen.dart';
import 'Views/Profile/CreateProfileStepFive.dart';
import 'Views/Profile/CreateProfileStepFour.dart';
import 'Views/Splash/SplashScreen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBt12nuP0oVbBWFnefA46uy5g7dodl1x4c',
          appId: '1:294198152135:android:3f53ef51fa6adc3d65e7e2',
          messagingSenderId: '294198152135',
          projectId: 'pull-up-live'));
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  bool checkLogin = _prefs.getBool("isLoggedIn") ?? false;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PullUpLiveProvider()),
    //ChangeNotifierProvider(create: (context) => GoogleSignInController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pull Up Live',
      navigatorKey: navigatorKey,
      home: SplashScreen(),
      initialRoute: Routes.splash,
      routes: AppRoutes.routes,
    );
  }
}
