import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pull_up_live/Entity/Response/InterestedIN/AddInterestedInResponse.dart';
import 'package:pull_up_live/Entity/Response/MatchedProfileResponse.dart';
import 'package:pull_up_live/Views/Profile/CreateProfileStepThree.dart';
import '../Entity/Response/Post/AddPostResponse.dart';
import '../Entity/Response/Car/CarListResponse.dart';
import '../Entity/Response/Car/CarModelResponse.dart';
import '../Entity/Response/Car/CarTransmissionResponse.dart';
import '../Entity/Response/InterestedIN/InterestedInResponse.dart';
import '../Entity/Response/Social Login/LogoutResponse.dart';
import '../Entity/Response/SOSResponse.dart';
import '../Entity/Response/StepOneResponse.dart';
import '../Entity/Response/Subscription/SubscriptionAddResponse.dart';
import '../Entity/Response/Subscription/SubscriptionDetailResponse.dart';
import '../Entity/Response/Subscription/SubscriptionListResponse.dart';
import '../Entity/Response/Car/SuperCarListResponse.dart';

import '../Entity/Response/Subscription/UserSubscriptionListResponse.dart';
import '../Utility/Environment.dart';
import '../Views/Login/Login.dart';

class ApiClient {
  //Car List
  Future<CarListResponse> carListApi(BuildContext context) async {
    CarListResponse objCarListResponse = CarListResponse(data: []);
    String carListUrl = Environment.baseUrl + Environment.carListUrl;
    print("Car List url:${carListUrl}");

    try {
      // Map<String, String> headers = {
      //   // "Content-type": "application/json",
      //   'Authorization': 'Bearer ${Environment.accessToken}'
      // };

      Map<String, dynamic> carListParams = {"car_category": "car"};

      var body = carListParams;
      // final encoding = Encoding.getByName('utf-8');

      print("carListParams :$body ");

      final response = await http.post(Uri.parse(carListUrl), body: body);

      print("car list body:${response.body}");

      int statusCode = response.statusCode;
      print("Car list statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objCarListResponse =
            CarListResponse.fromJson(jsonDecode(response.body));

        return objCarListResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushNamed('/createProfile');
      }
    } catch (e) {
      throw Exception(e);
    }
    return objCarListResponse;
  }

  //Super Car List
  Future<SuperCarListResponse> superCarListApi(BuildContext context) async {
    SuperCarListResponse objSuperCarListResponse =
        SuperCarListResponse(data: []);
    String supercarListUrl = Environment.baseUrl + Environment.superCarUrl;
    print("Car List url:${supercarListUrl}");

    try {
      // Map<String, String> headers = {
      //   // "Content-type": "application/json",
      //   'Authorization': 'Bearer ${Environment.accessToken}'
      // };

      Map<String, dynamic> supercarListParams = {"car_category": "super_car"};

      var body = supercarListParams;
      // final encoding = Encoding.getByName('utf-8');

      print("supercarListParams :$body ");

      final response = await http.post(Uri.parse(supercarListUrl), body: body);

      print("super car list body:${response.body}");

      int statusCode = response.statusCode;
      print("Super Car list statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objSuperCarListResponse =
            SuperCarListResponse.fromJson(jsonDecode(response.body));
        return objSuperCarListResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushNamed('/createProfile');
      }
    } catch (e) {
      throw Exception(e);
    }
    return objSuperCarListResponse;
  }

  //InterestedIn List
  Future<InterestedInResponse> interestedInListApi(BuildContext context) async {
    InterestedInResponse objInterestedInResponse =
        InterestedInResponse(data: InterestedInData(data: []));
    String interestedInListUrl =
        Environment.baseUrl + Environment.interestedInUrl;
    print("InterestedIn List url:${interestedInListUrl}");

    try {
      Map<String, String> headers = {
        // "Content-type": "application/json",
        'Authorization': 'Bearer ${Environment.accessToken}'
      };

      // Map<String, dynamic> supercarListParams = {"car_category": "super_car"};

      // var body = supercarListParams;
      // // final encoding = Encoding.getByName('utf-8');
      //
      // print("supercarListParams :$body ");

      final response =
          await http.get(Uri.parse(interestedInListUrl), headers: headers);

      print("InterestedIn list body:${response.body}");

      int statusCode = response.statusCode;
      print("InterestedIn list statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objInterestedInResponse =
            InterestedInResponse.fromJson(jsonDecode(response.body));
        return objInterestedInResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context).pushNamed('/createProfile');
      }
    } catch (e) {
      throw Exception(e);
    }
    return objInterestedInResponse;
  }

  // Car Model List
  Future<CarModelResponse> carModelListApi(
      String carBrandId, BuildContext context) async {
    CarModelResponse objCarModelResponse =
        CarModelResponse(message: "", status: 0, data: []);

    String carModelUrl = Environment.baseUrl + Environment.carModelUrl;
    print("car Model list url:${carModelUrl}");

    try {
      // Map<String, String> headers = {
      //   // 'Content-Type': 'application/json',
      //   // 'Charset': 'utf-8',
      //   'Authorization': 'Bearer ${Environment.accessToken}'
      // };

      Map<String, dynamic> carModelParams = {"car_brand_id": carBrandId};

      var body = carModelParams;
      // final encoding = Encoding.getByName('utf-8');

      print(" carModelParams :$body ");
      final response = await http.post(
        Uri.parse(carModelUrl),
        body: body,
        // headers: headers,
      );

      print("carModel list body:${response.body}");

      int statusCode = response.statusCode;
      print("carModel list statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        var data = await json.decode(json.encode(response.body));
        objCarModelResponse = carModelResponseFromJson(data);
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Login(),
        //   ),
        // );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objCarModelResponse;
  }

  //Car Transmission List
  Future<CarTransmissionResponse> carTransmissionListApi(
      BuildContext context) async {
    CarTransmissionResponse objCarTransmissionResponse =
        CarTransmissionResponse(data: []);
    String carTransmissionUrl =
        Environment.baseUrl + Environment.carTransmissionUrl;
    print("Car Transmission url:${carTransmissionUrl}");

    try {
      // Map<String, String> headers = {
      //   // "Content-type": "application/json",
      //   'Authorization': 'Bearer ${Environment.accessToken}'
      // };

      // Map<String, dynamic> carListParams = {"car_category": "car"};
      //
      // var body = carListParams;
      // // final encoding = Encoding.getByName('utf-8');
      //
      // print("carListParams :$body ");

      final response = await http.get(
        Uri.parse(carTransmissionUrl),
      );

      print("car Transmission body:${response.body}");

      int statusCode = response.statusCode;
      print("Car Transmission statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objCarTransmissionResponse =
            CarTransmissionResponse.fromJson(jsonDecode(response.body));

        return objCarTransmissionResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        // Navigator.of(context).pushNamed('/createProfile');
      }
    } catch (e) {
      throw Exception(e);
    }
    return objCarTransmissionResponse;
  }

  //Subscription Add

  Future<SubscriptionAddResponse> subscriptionAddApi(
      String userVehicleId,
      String userAddressId,
      String subscriptionId,
      String amount,
      BuildContext context) async {
    SubscriptionAddResponse objSubsAddResponse =
        SubscriptionAddResponse(data: SubscriptionAddData());
    String subsAddUrl = Environment.baseUrl + Environment.subscriptionAdd;
    print("subscription Add url:${subsAddUrl}");

    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, dynamic> subsAddParams = {
        "user_vehicle_id": userVehicleId,
        "user_address_id": userAddressId,
        "subscription_id": subscriptionId,
        "amount": amount
      };

      var body = subsAddParams;
      // final encoding = Encoding.getByName('utf-8');

      print("subsAddParams :$body ");

      final response =
          await http.post(Uri.parse(subsAddUrl), body: body, headers: headers);

      print("subs Add body:${response.body}");

      int statusCode = response.statusCode;
      print("subs add  statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");

        objSubsAddResponse =
            SubscriptionAddResponse.fromJson(jsonDecode(response.body));

        print("objSubsAddResponse:${objSubsAddResponse.data}");

        return objSubsAddResponse;
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objSubsAddResponse;
  }

  //User Subscription List

  Future<UserSubscriptionListResponse> userSubsListApi(
      BuildContext context) async {
    UserSubscriptionListResponse objUserSubsListResponse =
        UserSubscriptionListResponse(data: []);

    String userSubsListUrl =
        Environment.baseUrl + Environment.mySubscriptionList;
    print("userSubsListUrl  url:${userSubsListUrl}");

    try {
      Map<String, String> headers = {
        // 'Content-Type': 'application/json',
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      //  Map<String, dynamic> mySubListParams = {"month": month};

      // var body = mySubListParams;
      // // final encoding = Encoding.getByName('utf-8');
      //
      // print("mySubListParams :$body ");
      final response = await http.post(
        Uri.parse(userSubsListUrl),
        //  body: body,
        headers: headers,
      );

      print("userSubsList body:${response.body}");

      int statusCode = response.statusCode;
      print("user subs  list statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        var data = await json.decode(json.encode(response.body));
        objUserSubsListResponse = userSubscriptionListResponseFromJson(data);
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objUserSubsListResponse;
  }

  // Subscription List
  Future<SubscriptionListResponse> subscriptionListApi(
      BuildContext context) async {
    SubscriptionListResponse objSubscriptionListResponse =
        SubscriptionListResponse(message: "", status: 0, data: []);

    String subsListUrl = Environment.baseUrl + Environment.subscriptionListUrl;
    print("Subscription list url:${subsListUrl}");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      final response = await http.get(
        Uri.parse(subsListUrl),
        headers: headers,
      );

      print("Subscription list body:${response.body}");

      int statusCode = response.statusCode;
      print("Subscription list statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        var data = await json.decode(json.encode(response.body));
        objSubscriptionListResponse = subscriptionListResponseFromJson(data);
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objSubscriptionListResponse;
  }

  //Subscription Details
  Future<SubscriptionDetailResponse> subscriptionDetailsApi(
      String id, BuildContext context) async {
    SubscriptionDetailResponse objSubsDetailsResponse =
        SubscriptionDetailResponse(
            message: '',
            status: 0,
            data: SubscriptionDetailData(
                id: 0,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                name: '',
                price: '',
                duration: '',
                status: '',
                subscriptionDetails: [],
                image: '',
                media: []));
    String subscriptionDetailUrl =
        Environment.baseUrl + Environment.subscriptionDetailUrl;
    print("subscription url:${subscriptionDetailUrl}");

    try {
      Map<String, String> headers = {
        'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, String> subscriptionParams = {
        "id": id,
      };
      // final encoding = Encoding.getByName('utf-8');

      print("subscriptionParams :$subscriptionParams ");

      final response = await http.post(Uri.parse(subscriptionDetailUrl),
          body: subscriptionParams, headers: headers);

      print("subscription body:${response.body}");

      int statusCode = response.statusCode;
      print("subscription statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objSubsDetailsResponse =
            subscriptionDetailResponseFromJson(response.body);
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objSubsDetailsResponse;
  }

  //Logout Response
  Future<LogoutResponse> logoutApi() async {
    LogoutResponse objLogoutResponse = LogoutResponse(data: []);
    String logoutUrl = Environment.baseUrl + Environment.logoutUrl;
    print("logout url:${logoutUrl}");

    try {
      // Map<String, String> headers = {"Content-type": "application/json"};

      Map<String, String> headers = {
        'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };

      // Map<String, String> logoutParams = {
      //   "mobile": mobile,
      //   "country_code": "+91",
      //   "user_type": "customer"
      // };
      // final encoding = Encoding.getByName('utf-8');

      // print("logout params:$logoutParams");

      final response = await http.post(Uri.parse(logoutUrl), headers: headers
          //encoding: encoding,
          );

      print("logout body:${response.body}");

      int statusCode = response.statusCode;
      print("Logout statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objLogoutResponse = logoutResponseFromJson(response.body);
      } else if (statusCode == 422) {}
    } catch (e) {
      throw Exception(e);
    }
    return objLogoutResponse;
  }

  //SOS Location
  Future<SosResponse> sosApi(
      String lat, String long, BuildContext context) async {
    SosResponse objSosResponse = SosResponse(data: SOSData());
    String sosUrl = Environment.baseUrl + Environment.sosUrl;
    print("sos url:${sosUrl}");

    try {
      Map<String, String> headers = {
        'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, String> sosParams = {
        "latitude": lat,
        "longitude": long,
      };
      // final encoding = Encoding.getByName('utf-8');

      print("sosParams :$sosParams ");

      final response =
          await http.post(Uri.parse(sosUrl), body: sosParams, headers: headers);

      print("sos body:${response.body}");

      int statusCode = response.statusCode;
      print("sos statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objSosResponse = SosResponse.fromJson(jsonDecode(response.body));
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objSosResponse;
  }

  //Matched Profile Response
  Future<MatchedProfileResponse> matchedProfileApi() async {
    MatchedProfileResponse objMatchedProfileResponse =
        MatchedProfileResponse(data: []);
    String matchedProfileUrl = Environment.baseUrl + Environment.matchedProfile;
    print("matchedProfile url:${matchedProfileUrl}");

    try {
      // Map<String, String> headers = {"Content-type": "application/json"};

      Map<String, String> headers = {
        'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };

      final response =
          await http.post(Uri.parse(matchedProfileUrl), headers: headers
              //encoding: encoding,
              );

      print("matchedProfile body:${response.body}");

      int statusCode = response.statusCode;
      print("matchedProfile statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objMatchedProfileResponse =
            matchedProfileResponseFromJson(response.body);
      } else if (statusCode == 422) {}
    } catch (e) {
      throw Exception(e);
    }
    return objMatchedProfileResponse;
  }

  //Add Interested
  Future<AddInterestedInResponse> addInterestedInApi(
      String interested, BuildContext context) async {
    AddInterestedInResponse objAddInterestedInResponse =
        AddInterestedInResponse(data: AddInterestedInData());
    String addInterestedInUrl =
        Environment.baseUrl + Environment.addInterestedInUrl;
    print("AddInterestedIn url:${addInterestedInUrl}");

    try {
      Map<String, String> headers = {
        'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };
      Map<String, String> addInterestedInParams = {
        "interested_id": interested,
      };
      // final encoding = Encoding.getByName('utf-8');

      print("addInterestedInParams :$addInterestedInParams ");

      final response = await http.post(Uri.parse(addInterestedInUrl),
          body: addInterestedInParams, headers: headers);

      print("addInterestedInParams body:${response.body}");

      int statusCode = response.statusCode;
      print("addInterestedInParams statusCode: ${response.statusCode}");

      if (statusCode == 200) {
        objAddInterestedInResponse =
            AddInterestedInResponse.fromJson(jsonDecode(response.body));
      } else if (statusCode == 500) {
        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateProfileStepThree(),
          ),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
    return objAddInterestedInResponse;
  }
}
