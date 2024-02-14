import 'package:flutter/cupertino.dart';
import 'package:pull_up_live/Entity/Response/MatchedProfileResponse.dart';

import '../Entity/Response/Car/CarListResponse.dart';
import '../Entity/Response/Car/CarModelResponse.dart';
import '../Entity/Response/Car/CarTransmissionResponse.dart';
import '../Entity/Response/InterestedIN/InterestedInResponse.dart';
import '../Entity/Response/Social Login/LoginResponse.dart';
import '../Entity/Response/Social Login/LogoutResponse.dart';
import '../Entity/Response/SOSResponse.dart';
import '../Entity/Response/Subscription/SubscriptionAddResponse.dart';
import '../Entity/Response/Subscription/SubscriptionDetailResponse.dart';
import '../Entity/Response/Subscription/SubscriptionListResponse.dart';
import '../Entity/Response/Car/SuperCarListResponse.dart';
import '../Entity/Response/Subscription/UserSubscriptionListResponse.dart';
import 'ApiClient.dart';

class PullUpRepository {
  final ApiClient pullupApiClient = ApiClient();

//car list
  Future<CarListResponse> carListRepo(BuildContext context) async {
    try {
      final carListResponse = await pullupApiClient.carListApi(context);
      return carListResponse;
    } catch (e) {
      print("car List error:$e");
      rethrow;
    }
  }

  //car transmission
  Future<CarTransmissionResponse> carTransmissionRepo(
      BuildContext context) async {
    try {
      final carTransmissionResponse =
          await pullupApiClient.carTransmissionListApi(context);
      return carTransmissionResponse;
    } catch (e) {
      print("car Transmission error:$e");
      rethrow;
    }
  }

  //super car list
  Future<SuperCarListResponse> superCarListRepo(BuildContext context) async {
    try {
      final superCarListResponse =
          await pullupApiClient.superCarListApi(context);
      return superCarListResponse;
    } catch (e) {
      print("superCar List error:$e");
      rethrow;
    }
  }

  //interestedin list
  Future<InterestedInResponse> interestedInListRepo(
      BuildContext context) async {
    try {
      final interestedInListResponse =
          await pullupApiClient.interestedInListApi(context);
      return interestedInListResponse;
    } catch (e) {
      print("interestedInList error:$e");
      rethrow;
    }
  }

  //Car Model List
  Future<CarModelResponse> carModelListRepo(
      String carBrandId, BuildContext context) async {
    try {
      final carModelListResponse =
          await pullupApiClient.carModelListApi(carBrandId, context);
      return carModelListResponse;
    } catch (e) {
      print("Car Model list error:$e");
      rethrow;
    }
  }

  //Subscription List
  Future<SubscriptionListResponse> subscriptionListRepo(
      BuildContext context) async {
    try {
      final subsListResponse =
          await pullupApiClient.subscriptionListApi(context);
      return subsListResponse;
    } catch (e) {
      print("Subscription list error:$e");
      rethrow;
    }
  }

  //Subscription Details
  Future<SubscriptionDetailResponse> subsDetailsRepo(
      String id, BuildContext context) async {
    try {
      final subsDetailResponse =
          await pullupApiClient.subscriptionDetailsApi(id, context);
      return subsDetailResponse;
    } catch (e) {
      print("Subscription Details error:$e");
      rethrow;
    }
  }

  //Subscription Add
  Future<SubscriptionAddResponse> subsAddRepo(
      String userVehicleId,
      String userAddressId,
      String subscriptionId,
      String amount,
      BuildContext context) async {
    try {
      final subsAddResponse = await pullupApiClient.subscriptionAddApi(
          userVehicleId, userAddressId, subscriptionId, amount, context);
      return subsAddResponse;
    } catch (e) {
      print("subs Add error:$e");
      rethrow;
    }
  }

  //User Subscription List
  Future<UserSubscriptionListResponse> userSubsListRepo(
      BuildContext context) async {
    try {
      final userSubsListResponse =
          await pullupApiClient.userSubsListApi(context);
      return userSubsListResponse;
    } catch (e) {
      print("User Subscription  list error:$e");
      rethrow;
    }
  }

  //logout
  Future<LogoutResponse> logoutRepo() async {
    try {
      final logoutResponse = await pullupApiClient.logoutApi();
      return logoutResponse;
    } catch (e) {
      print("logout error:$e");
      rethrow;
    }
  }

  //sos
  Future<SosResponse> sosRepo(
      String lat, String long, BuildContext context) async {
    try {
      final sosResponse = await pullupApiClient.sosApi(lat, long, context);
      return sosResponse;
    } catch (e) {
      print("sos error:$e");
      rethrow;
    }
  }

  //matched profile
  Future<MatchedProfileResponse> matchedProfileRepo() async {
    try {
      final matchedProfileResponse = await pullupApiClient.matchedProfileApi();
      return matchedProfileResponse;
    } catch (e) {
      print("matchedProfile error:$e");
      rethrow;
    }
  }
}
