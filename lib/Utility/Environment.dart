class Environment {
  static String accessToken = "";
  static String userName = "";
  static String loginMobileNumber = "";
  static String profileName = "";
  static String profileEmail = "";
  static int selectedIndex = 0;
  static String notificationStatus = "0";
  static int? accountDetails = 0;
  static const String baseUrl =
      "https://binarymetrix-staging.com/pullUp/public/api/";

  static const String loginUrl = "user/login";
  static const String carListUrl = "user/carslist";
  static const String superCarUrl = "user/supercarslist";
  static const String interestedInUrl = "user/step-2";
  static const String addInterestedInUrl = "user/add-interested";

  //For Car Model
  static const String carModelUrl = "setting/car-models";
  static const String carTransmissionUrl = "user/cars-Transmission";
  static const String createEventUrl = "events/add-events";
  static const String createClubUrl = "clubs/add-clubs";

  // For Subscription
  static const String subscriptionListUrl = "subscription/subscription_lists";
  static const String subscriptionDetailUrl =
      "subscriptiondetails/subscription_details";
  static const String subscriptionAdd = "usersubscription/create";
  static const String mySubscriptionList = "usersubscription/list";

  // For adding post
  static const String addPostUrl = "posts/add-posts";

  //loout

  static const String logoutUrl = "user/logout";

  //sos
  static const String sosUrl = "user/sos-location";

  // Profile Steps

  static const String stepOneUrl = "user/step-1";

  //Profile Video
  static const String profileVideo = "user/profile-video";
  static const String matchedProfile = "user/matched_profile";
}
