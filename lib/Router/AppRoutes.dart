import 'package:pull_up_live/Views/CreateClub.dart';
import 'package:pull_up_live/Views/CreateEvent.dart';
import 'package:pull_up_live/Views/MessagesScreen.dart';
import 'package:pull_up_live/Views/NotificationScreen.dart';
import 'package:pull_up_live/Views/PaySecurily.dart';
import 'package:pull_up_live/Views/PostingInScreen.dart';
import 'package:pull_up_live/Views/Profile/CreateProfileStepTwo.dart';
import 'package:pull_up_live/Views/Settings.dart';
import 'package:pull_up_live/Views/matchedProfiles.dart';

import '../Views/Celebration.dart';
import '../Views/Following/DiscoverScreen.dart';
import '../Views/Following/FollowingScreen.dart';
import '../Views/InterestedInScreen.dart';
import '../Views/JoinClubScreen.dart';
import '../Views/Login/Login.dart';
import '../Views/MatchedProfileDetails.dart';
import '../Views/MessageDetail.dart';
import '../Views/MyAccountScreen.dart';
import '../Views/Profile/CreateProfile.dart';
import '../Views/Profile/CreateProfileStepFive.dart';
import '../Views/Profile/CreateProfileStepFive2.dart';
import '../Views/Profile/CreateProfileStepFour.dart';
import '../Views/Profile/CreateProfileStepThree.dart';
import '../Views/ScreenNo25.dart';
import '../Views/Settings2.dart';
import '../Views/Splash/SplashScreen.dart';
import 'Routes.dart';

class AppRoutes {
  static var routes = {
    Routes.splash: (context) => const SplashScreen(),
    Routes.login: (context) => Login(),
    Routes.createProfile: (context) => CreateProfile(),
    Routes.createProfileStepTwo: (context) => CreateProfileStepTwo(),
    Routes.createProfileStepThree: (context) => CreateProfileStepThree(),
    Routes.createProfileStepFour: (context) => CreateProfileStepFour(),
    Routes.createProfileStepFive: (context) => CreateProfileStepFive(),
    Routes.createProfileStepFive2: (context) => CreateProfileStepFive2(),
    Routes.settings: (context) => Settings(),
    Routes.settings2: (context) => Settings2(),
    Routes.notification: (context) => NotificationScreen(),
    Routes.createEvent: (context) => CreateEventScreen(),
    Routes.createClub: (context) => CreateClubScreen(),
    Routes.postingIn: (context) => PostingInScreen(),
    Routes.celebration: (context) => CelebrationScreen(),
    Routes.interestedIn: (context) => InterestedInScreen(),
    Routes.screenNo25: (context) => ScreenNo25(),
    Routes.paySecurely: (context) => PaySecurilyScreen(),
    Routes.matchedProfiles: (context) => MatchedProfilesScreen(),
    Routes.matchedProfileDetails: (context) => MatchedProfileDetailsScreen(),
    Routes.messageScreen: (context) => MessagesScreen(),
    Routes.discoverScreen: (context) => DiscoverScreen(),
    Routes.followingScreen: (context) => FollowingScreen(),
    Routes.joinClubScreen: (context) => JoinClubScreen(),
    Routes.messageDetailScreen: (context) => MessageDetailScreen(),
    Routes.myAccountScreen: (context) => MyAccountScreen(),
  };
}
