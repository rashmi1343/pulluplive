import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_up_live/Entity/Response/Car/CarTransmissionResponse.dart';
import 'package:pull_up_live/Entity/Response/Events/CreateEventResponse.dart';
import 'package:pull_up_live/Interactor/PullUpRepository.dart';

import '../Entity/Response/Car/CarListResponse.dart';
import '../Entity/Response/Car/CarListResponse.dart';
import '../Entity/Response/Car/CarModelResponse.dart';
import '../Entity/Response/Club/CreateClubResponse.dart';
import '../Entity/Response/InterestedIN/InterestedInResponse.dart';
import '../Entity/Response/Social Login/LoginResponse.dart';
import '../Entity/Response/Social Login/LogoutResponse.dart';
import '../Entity/Response/MatchedProfileResponse.dart';
import '../Entity/Response/SOSResponse.dart';
import '../Entity/Response/StepOneResponse.dart';
import '../Entity/Response/Subscription/SubscriptionAddResponse.dart';
import '../Entity/Response/Subscription/SubscriptionDetailResponse.dart';
import '../Entity/Response/Subscription/SubscriptionListResponse.dart';
import '../Entity/Response/Car/SuperCarListResponse.dart';
import '../Entity/Response/Subscription/UserSubscriptionListResponse.dart';
import '../Utility/ColorTheme.dart';
import '../Utility/Environment.dart';
import '../Views/Login/Login.dart';
import '../Views/Profile/CreateProfileStepTwo.dart';

class PullUpLiveProvider extends ChangeNotifier {
  //var _googleSignIn = GoogleSignIn();
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isUserSignedIn = false;
  GoogleSignInAccount? googleAccount;

  //final FirebaseAuth _auth = FirebaseAuth.instance;

  var GOOGLE_CLIENT_DEV_KEY =
      "294198152135-57bhgkkjhce1bjhomhpskat879ahpr33.apps.googleusercontent.com";

  logout() async {
    this.googleAccount = await _googleSignIn.signOut();
    notifyListeners();
  }

  Future<User?> signInWithGoogle(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    LoginResponse objLoginResponse =
        LoginResponse(data: LoginData(accessToken: ''));
    String loginUrl = Environment.baseUrl + Environment.loginUrl;
    print("login url:${loginUrl}");
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        print("google name:${user?.displayName}");
        print("google email:${user?.email}");
        print(
            "google signIn accessToken:${userCredential.credential?.providerId}");
        print("google signIn accessTokenId:${googleAuth.idToken}");
        Map<String, String> loginParams = {
          "user_type": "user",
          "name": "${user?.displayName}",
          "email": "${user?.email}",
          "google_id": GOOGLE_CLIENT_DEV_KEY,
        };
        // final encoding = Encoding.getByName('utf-8');

        print("login params:$loginParams");

        final response = await http.post(
          Uri.parse(loginUrl),
          body: loginParams,
          //encoding: encoding,
        );

        print("login body:${response.body}");

        int statusCode = response.statusCode;
        print("Login statusCode: ${response.statusCode}");

        if (statusCode == 200) {
          objLoginResponse = loginResponseFromJson(response.body);

          Environment.accessToken = objLoginResponse.data.accessToken;
          Environment.userName = objLoginResponse.data.name.toString();
          print("Access token:${Environment.accessToken}");
          print("User Name:${Environment.userName}");
          Navigator.of(context).pushNamed('/createProfile');
        } else if (statusCode == 422) {
          // Fluttertoast.showToast(
          //     msg: "The mobile number format is invalid.",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
        }

        notifyListeners();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }

  Future<User?> signInWithFacebook(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    LoginResponse objLoginResponse =
        LoginResponse(data: LoginData(accessToken: ''));
    String loginUrl = Environment.baseUrl + Environment.loginUrl;
    print("login url:${loginUrl}");
    final _instance = FacebookAuth.instance;
    final result = await _instance.login(permissions: ['public_profile']);

    if (result.status == LoginStatus.success) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      try {
        final a = await auth.signInWithCredential(credential);

        user = a.user;
        print("facebook name:${user?.displayName}");
        print("facebook email:${user?.email}");
        print("google signIn accessToken:${a.credential?.providerId}");

        Map<String, String> loginParams = {
          "user_type": "user",
          "name": "${user?.displayName}",
          "email": "${user?.email}",
          "facebook_id": GOOGLE_CLIENT_DEV_KEY,
        };
        // final encoding = Encoding.getByName('utf-8');

        print("login params:$loginParams");

        final response = await http.post(
          Uri.parse(loginUrl),
          body: loginParams,
          //encoding: encoding,
        );

        print("login body:${response.body}");

        int statusCode = response.statusCode;
        print("Login statusCode: ${response.statusCode}");

        if (statusCode == 200) {
          objLoginResponse = loginResponseFromJson(response.body);

          Environment.accessToken = objLoginResponse.data.accessToken;
          print("Access token:${Environment.accessToken}");
        } else if (statusCode == 422) {
          // Fluttertoast.showToast(
          //     msg: "The mobile number format is invalid.",
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
        }

        notifyListeners();

        Navigator.of(context).pushNamed('/createProfile');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    return user;
  }

  Future<String?> loginWithFacebook(BuildContext context) async {
    try {
      final _instance = FacebookAuth.instance;
      final result =
          await _instance.login(permissions: ['email', 'public_profile']);
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final a = await _auth.signInWithCredential(credential);
        print("Facebook email:${a.user?.email.toString()}");
        print("Facebook name:${a.user?.displayName.toString()}");

        await _instance.getUserData().then((userData) async {
          await _auth.currentUser!.updateEmail(userData['email']);
        });
        return null;
      } else if (result.status == LoginStatus.cancelled) {
        return 'Login cancelled';
      } else {
        return 'Error';
      }
    } catch (e) {
      return e.toString();
    }
  }

  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    //setState(() {
    this.isLoggedIn = isLoggedIn;
    notifyListeners();
    // });
  }

  void initiateFacebookLogin(BuildContext context) async {
    final facebookLogin = FacebookLogin();
    final facebookLoginResult =
        await facebookLogin.logIn(customPermissions: ['email']);

    print(facebookLoginResult.accessToken);
    print(facebookLoginResult.accessToken?.token);
    print(facebookLoginResult.accessToken?.expires);
    print(facebookLoginResult.accessToken?.permissions);
    print(facebookLoginResult.accessToken?.userId);
    //print(facebookLoginResult.accessToken?.isValid());

    //print(facebookLoginResult.errorMessage);
    print(facebookLoginResult.status);

    final token = facebookLoginResult.accessToken?.token;

    /// for profile details also use the below code
    final graphResponse = await http.get(Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token'));
    final profile = json.decode(graphResponse.body);
    print(profile);
    /*
    from profile you will get the below params
    {
     "name": "Iiro Krankka",
     "first_name": "Iiro",
     "last_name": "Krankka",
     "email": "iiro.krankka\u0040gmail.com",
     "id": "<user id here>"
    }
   */
  }

  bool profileCheckBox = false;
  int currentIndex = 0;
  bool ischipselected = false;
  List selectedCarIndexs = [];
  int _selectedIndex = 0;

  bool isLoading = false;
  bool isSuccess = false;
  bool isError = false;
  final pullUpRepo = PullUpRepository();

  // Initial Selected Value
  String? _cardropdownvalue = "";

  String? get cardropdownvalue => _cardropdownvalue;

  void setCarDropDown(String? value) {
    _cardropdownvalue = value;
    notifyListeners();
  }

  //Car List
  CarListResponse _objCarListResponse = CarListResponse(data: []);

  CarListResponse get objCarListResponse => _objCarListResponse;
  String? dropdownvalue;
  List<CarListData> carDataList = [];

  Future<CarListResponse> getCarListApi(BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      // notifyListeners();
      final carListResponse = await pullUpRepo.carListRepo(context);
      _objCarListResponse = carListResponse;
      if (_objCarListResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        carDataList = _objCarListResponse.data;

        print("car list api Called Successfully");

        // Timer(
        //     const Duration(seconds: 2),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Dashboard())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objCarListResponse;
  }

  //Car Transmission
  CarTransmissionResponse _objCarTransmissionResponse =
      CarTransmissionResponse(data: []);

  CarTransmissionResponse get objCarTransmissionResponse =>
      _objCarTransmissionResponse;

  String? transmissiondropdownvalue;
  List<TransmissionData> carTransmissionList = [];

  Future<CarTransmissionResponse> getCarTransmissionApi(
      BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final carTransmissionResponse =
          await pullUpRepo.carTransmissionRepo(context);
      _objCarTransmissionResponse = carTransmissionResponse;
      if (_objCarTransmissionResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        carTransmissionList = _objCarTransmissionResponse.data;

        print("car transmission api Called Successfully");

        // Timer(
        //     const Duration(seconds: 2),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Dashboard())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objCarTransmissionResponse;
  }

  //Super Car List
  SuperCarListResponse _objSuperCarListResponse =
      SuperCarListResponse(data: []);

  SuperCarListResponse get objSuperCarResponse => _objSuperCarListResponse;

  Future<SuperCarListResponse> getSuperCarListApi(BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final superCarListResponse = await pullUpRepo.superCarListRepo(context);
      _objSuperCarListResponse = superCarListResponse;
      if (_objSuperCarListResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        print("super car list api Called Successfully");

        // Timer(
        //     const Duration(seconds: 2),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Dashboard())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objSuperCarListResponse;
  }

  //Interested In List
  InterestedInResponse _objInterestedInListResponse =
      InterestedInResponse(data: InterestedInData(data: []));

  InterestedInResponse get objInterestedInResponse =>
      _objInterestedInListResponse;

  Future<InterestedInResponse> getInterestedInListApi(
      BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final interestedInListResponse =
          await pullUpRepo.interestedInListRepo(context);
      _objInterestedInListResponse = interestedInListResponse;
      if (_objInterestedInListResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        // Fluttertoast.showToast(
        //     msg: "Profile has been updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        print("InterestedIn list api Called Successfully");

        // Timer(
        //     const Duration(seconds: 2),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Dashboard())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objInterestedInListResponse;
  }

  final ImagePicker picker = ImagePicker();
  File? selectedProfileImages;

  Future getProfileImages(ImageSource source) async {
    final pickedFile = await picker.pickImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000, source: source);
    XFile? xfilePick = pickedFile;

    // if (xfilePick!.isNotEmpty) {
    //  for (var i = 0; i < xfilePick.length; i++) {

    if (pickedFile != null) {
      selectedProfileImages = File(pickedFile.path);
    }

    notifyListeners();
    //}
    // }
  }

  bool isCarSelected = false;
  int selectedCarIndex = -1; // to know active index
  String _carName = "";

  String get carName => _carName;
  int carId = 0;

  void toggleCarSelected(int index, value) {
    isCarSelected = true;
    _carName = value;
    selectedCarIndex = index;
    carId = objCarListResponse.data[selectedCarIndex].id;
    // carId = carDataArr[selectedCarIndex].id;
    print(" carId:$carId");

    notifyListeners();
  }

  bool isSuperCarSelected = false;
  int selectedSuperCarIndex = -1; // to know active index
  String _superCarName = "";

  String get superCarName => _superCarName;
  int supercarId = 0;

  void toggleSuperCarSelected(int index, value) {
    isSuperCarSelected = true;
    _superCarName = value;
    selectedSuperCarIndex = index;
    supercarId = objSuperCarResponse.data[selectedSuperCarIndex].id;
    // carId = carDataArr[selectedCarIndex].id;
    print(" supercarId:$supercarId");

    notifyListeners();
  }

  bool isGenderSelected = false;
  String _selectedGenderType = "";

  String get selectedGenderType => _selectedGenderType;

  void setSelectedGenderTypeText(String selectedGenderTypeText) {
    _selectedGenderType = selectedGenderTypeText;
    notifyListeners();
  }

  //Car Model List
  CarModelResponse _objCarModelListResponse =
      CarModelResponse(message: "", status: 0, data: []);

  CarModelResponse get objCarModelListResponse => _objCarModelListResponse;
  String? carModeldropdownvalue;
  List<CarModelData> carModelDataList = [];

  Future<CarModelResponse> getCarModelListApi(
      String carBrandId, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final carModelListResponse =
          await pullUpRepo.carModelListRepo(carBrandId, context);
      _objCarModelListResponse = carModelListResponse;
      if (_objCarModelListResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        carModelDataList = _objCarModelListResponse.data;

        print("car Model list api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objCarModelListResponse;
  }

  TextEditingController _createEventNameController = TextEditingController();

  TextEditingController get createEventNameController =>
      _createEventNameController;
  TextEditingController _createEventDescController = TextEditingController();

  TextEditingController get createEventDescController =>
      _createEventDescController;

  String eventStartDate = "";
  String eventEndDate = "";
  String eventStartTime = "";
  String eventEndTime = "";

  Future<void> selectStartTime(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      eventStartTime = picked.hour.toString() + ':' + picked.minute.toString();
      print({picked.hour.toString() + ':' + picked.minute.toString()});
      notifyListeners();
    }
  }

  Future<void> selectEndTime(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      eventEndTime = picked.hour.toString() + ':' + picked.minute.toString();
      print({picked.hour.toString() + ':' + picked.minute.toString()});
      notifyListeners();
    }
  }

  Future<void> selectStartDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      eventStartDate = picked.toString();
      print({picked.toString()});
      notifyListeners();
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      eventEndDate = picked.toString();
      print({picked.toString()});
      notifyListeners();
    }
  }

  String? currentAddress;
  String location = "";
  Position? currentPosition;

  Future<bool> handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    final hasPermission = await handleLocationPermission(context);

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      notifyListeners();
      getAddressFromLatLng(currentPosition!, context);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  var cityName = "";
  Placemark? place;
  List<Placemark> placemarks = [];

  Future<void> getAddressFromLatLng(
      Position position, BuildContext context) async {
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      place = placemarks[0];

      currentAddress = place!.street.toString() +
          ", " +
          place!.locality.toString() +
          ", " +
          place!.subLocality.toString() +
          ", " +
          place!.administrativeArea.toString() +
          ", " +
          place!.postalCode.toString();

      cityName = place!.subAdministrativeArea.toString();
      notifyListeners();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  File? eventimage;
  File? clubimage;

  final eventpicker = ImagePicker();
  final clubpicker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery(ImageSource source) async {
    final pickedFile = await eventpicker.pickImage(source: source);

    if (pickedFile != null) {
      eventimage = File(pickedFile.path);
    }
    notifyListeners();
  }

  //Image Picker function to get image from gallery
  Future getClubImageFromGallery(ImageSource source) async {
    final clubpickedFile = await clubpicker.pickImage(source: source);

    if (clubpickedFile != null) {
      clubimage = File(clubpickedFile.path);
    }
    notifyListeners();
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera(ImageSource source) async {
    final pickedFile = await eventpicker.pickImage(source: source);

    //setState(() {
    if (pickedFile != null) {
      eventimage = File(pickedFile.path);
    }
    notifyListeners();
    // });
  }

  //Image Picker function to get image from camera
  Future getClubImageFromCamera(ImageSource source) async {
    final clubpickedFile = await clubpicker.pickImage(source: source);

    //setState(() {
    if (clubpickedFile != null) {
      clubimage = File(clubpickedFile.path);
    }
    notifyListeners();
    // });
  }

  //Create event
  Future<CreateEventResponse> getCreateEventApi(
      String eventName,
      String eventDesc,
      String lat,
      String long,
      String address,
      String startDate,
      String startTime,
      String endDate,
      String endTime,
      BuildContext context) async {
    CreateEventResponse objCreateEventResponse = CreateEventResponse();
    String createEventUrl = Environment.baseUrl + Environment.createEventUrl;
    print("createEventUrl:${createEventUrl}");
    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };

      var request = http.MultipartRequest('POST', Uri.parse(createEventUrl));

      request.fields['name'] = eventName;
      request.fields['description'] = eventDesc;
      request.fields['latitude'] = lat;
      request.fields['longitude'] = long;
      request.fields['address'] = address;
      request.fields['start_date'] = startDate;
      request.fields['end_date'] = endDate;
      request.fields['start_time'] = startTime;
      request.fields['end_time'] = endTime;

      request.headers.addAll(headers);

      // if (image != null) {
      //   request.files.add(
      //       await http.MultipartFile.fromPath('document[]', uploadFileName));
      // }

      // for (int i = 0; i < selectedWashImages.length; i++) {
      final f = await http.MultipartFile.fromPath('image', eventimage!.path);
      request.files.add(f);
      //  }

      printCreateEventParams(request);
      // var body = profileUpdateParams;
      // final encoding = Encoding.getByName('utf-8');

      // print("profileUpdateParams :$body ");

      // final response = await http.post(Uri.parse(profileUpdateUrl),
      //     body: body, headers: headers);

      final response = await request.send();
      var res = await http.Response.fromStream(response);

      // print("profile update body:${response.body}");

      int statusCode = res.statusCode;
      print("create event statusCode: ${res.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objCreateEventResponse =
            CreateEventResponse.fromJson(jsonDecode(res.body));

        print("objCreateEventResponse:${objCreateEventResponse.data}");
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        Fluttertoast.showToast(
            msg: "${objCreateEventResponse.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);

        print("Create event api called Successfully");

        // Timer(
        //     const Duration(seconds: 1),
        //     () => Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => AppBottomNav())));
        return objCreateEventResponse;
      } else if (statusCode == 500) {
        isLoading = false;
        isError = false;

        notifyListeners();

        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      isLoading = false;
      isError = true;

      notifyListeners();
      print("Exception:$e");
    }
    return objCreateEventResponse;
  }

  void printCreateEventParams(http.MultipartRequest request) {
    request.fields.forEach((key, value) {
      print("Create Event  Params $key:$value");
    });
  }

  //Create club
  Future<CreateClubResponse> getCreateClubApi(
      String eventName,
      String eventDesc,
      String lat,
      String long,
      String address,
      String categories,
      BuildContext context) async {
    CreateClubResponse objCreateClubResponse = CreateClubResponse();
    String createClubUrl = Environment.baseUrl + Environment.createClubUrl;
    print("createClubUrl:${createClubUrl}");
    try {
      final headers = {
        // 'Charset': 'utf-8',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };

      var request = http.MultipartRequest('POST', Uri.parse(createClubUrl));

      request.fields['name'] = eventName;
      request.fields['description'] = eventDesc;
      request.fields['latitude'] = lat;
      request.fields['longitude'] = long;
      request.fields['address'] = address;
      request.fields['categories'] = categories;

      request.headers.addAll(headers);

      // if (image != null) {
      //   request.files.add(
      //       await http.MultipartFile.fromPath('document[]', uploadFileName));
      // }

      // for (int i = 0; i < selectedWashImages.length; i++) {
      final f = await http.MultipartFile.fromPath('image', clubimage!.path);
      request.files.add(f);
      //  }

      printCreateClubParams(request);
      // var body = profileUpdateParams;
      // final encoding = Encoding.getByName('utf-8');

      // print("profileUpdateParams :$body ");

      // final response = await http.post(Uri.parse(profileUpdateUrl),
      //     body: body, headers: headers);

      final response = await request.send();
      var res = await http.Response.fromStream(response);

      // print("profile update body:${response.body}");

      int statusCode = res.statusCode;
      print("create Club statusCode: ${res.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objCreateClubResponse =
            CreateClubResponse.fromJson(jsonDecode(res.body));

        print("objCreateClubResponse:${objCreateClubResponse.data}");
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        Fluttertoast.showToast(
            msg: "${objCreateClubResponse.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);

        print("Create Club api called Successfully");

        // Timer(
        //     const Duration(seconds: 1),
        //     () => Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => AppBottomNav())));
        return objCreateClubResponse;
      } else if (statusCode == 500) {
        isLoading = false;
        isError = false;

        notifyListeners();

        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      isLoading = false;
      isError = true;

      notifyListeners();
      print("Exception:$e");
    }
    return objCreateClubResponse;
  }

  void printCreateClubParams(http.MultipartRequest request) {
    request.fields.forEach((key, value) {
      print("Create Club Params $key:$value");
    });
  }

  //Subscription Add
  SubscriptionAddResponse _objSubsAddResponse =
      SubscriptionAddResponse(data: SubscriptionAddData());

  SubscriptionAddResponse get objSubsAddResponse => _objSubsAddResponse;

  Future<SubscriptionAddResponse> getSubscriptionAddApi(
      String userVehicleId,
      String userAddressId,
      String subscriptionId,
      String amount,
      BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      // notifyListeners();
      final subsAddResponse = await pullUpRepo.subsAddRepo(
          userVehicleId, userAddressId, subscriptionId, amount, context);
      _objSubsAddResponse = subsAddResponse;
      if (_objSubsAddResponse.status == 200) {
        if (objSubsAddResponse.data is Map<String, dynamic> &&
            objSubsAddResponse.data.isNotEmpty) {
          isLoading = false;
          isSuccess = true;
          isError = true;

          notifyListeners();
          Fluttertoast.showToast(
              msg: "${objSubsAddResponse.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: ColorTheme.themeGreenColor,
              textColor: Colors.white,
              fontSize: 16.0);

          print("subscription  add api Called Successfully");

          // Timer(
          //     const Duration(seconds: 1),
          //     () => Navigator.of(context).push(PageRouteBuilder(
          //           transitionDuration: const Duration(milliseconds: 400),
          //           pageBuilder: (context, animation, secondaryAnimation) =>
          //               Dashboard(),
          // transitionsBuilder: (BuildContext context,
          //     Animation<double> animation,
          //     Animation<double> secondaryAnimation,
          //     Widget child) {
          //   return new SlideTransition(
          //     position: new Tween<Offset>(
          //       //Left to right
          //       begin: const Offset(-1.0, 0.0),
          //       end: Offset.zero,
          //
          //       //Right to left
          //       // begin: const Offset(1.0, 0.0),
          //       // end: Offset.zero,
          //
          //       //top to bottom
          //       // begin: const Offset(0.0, -1.0),
          //       // end: Offset.zero,
          //
          //       //   bottom to top
          //       // begin: Offset(0.0, 1.0),
          //       // end: Offset.zero,
          //     ).animate(animation),
          //     child: child,
          //   );
          // }
          //   transitionsBuilder:
          //       (context, animation, secondaryAnimation, page) {
          //     var begin = 0.0;
          //     var end = 1.0;
          //     var curve = Curves.ease;
          //
          //     var tween = Tween(begin: begin, end: end)
          //         .chain(CurveTween(curve: curve));
          //     return ScaleTransition(
          //       scale: animation.drive(tween),
          //       child: page,
          //     );
          //   },
          // ))

          // Navigator.push(
          // context, MaterialPageRoute(builder: (context) => Dashboard()))

          //  );
        } else if (objSubsAddResponse.data is List<dynamic> &&
            objSubsAddResponse.data.isEmpty) {
          isLoading = false;
          isSuccess = true;
          isError = true;

          notifyListeners();
          Fluttertoast.showToast(
              msg: "${objSubsAddResponse.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        isLoading = false;
        isError = false;

        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;

      notifyListeners();
      print("Exception:$e");
    }
    return _objSubsAddResponse;
  }

  //User Subscription List
  UserSubscriptionListResponse _objUserSubsListResponse =
      UserSubscriptionListResponse(data: []);

  UserSubscriptionListResponse get objUserSubsListResponse =>
      _objUserSubsListResponse;

  Future<UserSubscriptionListResponse> getUserSubscriptionListApi(
      BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final userSubsListResponse = await pullUpRepo.userSubsListRepo(context);
      _objUserSubsListResponse = userSubsListResponse;
      if (_objUserSubsListResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        print("user subscription list api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objUserSubsListResponse;
  }

  //Subscription Details

  SubscriptionDetailResponse _objSubsDetailsResponse =
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

  SubscriptionDetailResponse get objSubsDetailsResponse =>
      _objSubsDetailsResponse;

  Future<SubscriptionDetailResponse> getSubsDetailsApi(
      String id, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final subsDetailsResponse = await pullUpRepo.subsDetailsRepo(id, context);
      _objSubsDetailsResponse = subsDetailsResponse;
      if (_objSubsDetailsResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        // Fluttertoast.showToast(
        //     msg: "Records retrieved successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);

        //  getAddressListApi(context);

        print("Subscription details api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objSubsDetailsResponse;
  }

  //Subscription List
  SubscriptionListResponse _objSubscriptionListResponse =
      SubscriptionListResponse(message: "", status: 0, data: []);

  SubscriptionListResponse get objSubscriptionListResponse =>
      _objSubscriptionListResponse;

  Future<SubscriptionListResponse> getSubscriptionListApi(
      BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final subsListResponse = await pullUpRepo.subscriptionListRepo(context);
      _objSubscriptionListResponse = subsListResponse;
      if (_objSubscriptionListResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();

        print("subscription list api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objSubscriptionListResponse;
  }

  TextEditingController _profileNameController = TextEditingController();
  TextEditingController get profileNameController => _profileNameController;

  TextEditingController _profileBioController = TextEditingController();
  TextEditingController get profileBioController => _profileBioController;

  TextEditingController _profileInstaController = TextEditingController();
  TextEditingController get profileInstaController => _profileInstaController;

  TextEditingController _profileYouTubeController = TextEditingController();
  TextEditingController get profileYouTubeController =>
      _profileYouTubeController;

  bool logoutClicked = false;
  final ImagePicker profilepicker = ImagePicker();

  XFile? image;

  // Future pickImages(ImageSource media) async {
  //   try {
  //     image = await profilepicker.pickImage(source: media);
  //     //if (image == null) return;
  //
  //     //image = pickImage;
  //
  //     var uploadImageUrl = Environment.baseUrl + Environment.uploadPhotoUrl;
  //     uploadImage(image, uploadImageUrl);
  //     notifyListeners();
  //     // FilePickerResult? imageResult = await FilePicker.platform.pickFiles(
  //     //   allowMultiple: true,
  //     //   type: FileType.custom,
  //     //   allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg'],
  //     // );
  //     //
  //     // print("imageResult:${imageResult.files.}")
  //     // if (imageResult != null) {
  //     //   List files = imageResult.paths
  //     //       .map((path) => MultipartFile.fromFileSync(
  //     //             path.toString(),
  //     //             filename: imageResult.paths.split("/").last,
  //     //             contentType: MediaType('image')
  //     //
  //     //           ))
  //     //       .toList();
  //     //   var dio = Dio();
  //     //   var formData = FormData.fromMap({
  //     //     'profile_image': files,
  //     //   });
  //     //   var response = await dio.post(uploadImageUrl, data: formData);
  //     //
  //     //   if (response.statusCode == 200) {
  //     //     isLoading = false;
  //     //     isSuccess = true;
  //     //     isError = true;
  //     //     notifyListeners();
  //     //
  //     //     Fluttertoast.showToast(
  //     //         msg: "Image Uploaded Successfully",
  //     //         toastLength: Toast.LENGTH_SHORT,
  //     //         gravity: ToastGravity.CENTER,
  //     //         timeInSecForIosWeb: 1,
  //     //         backgroundColor: ColorTheme.themeGreenColor,
  //     //         textColor: Colors.white,
  //     //         fontSize: 16.0);
  //     //
  //     //     print("upload api Called Successfully");
  //     //     // it's uploaded
  //     //   }
  //     // } else {
  //     //   // User canceled the picker
  //     // }
  //     // notifyListeners();
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }
  // Future<UploadPhotoResponse> uploadImage(
  //     XFile? file, String uploadImageUrl) async {
  //   UploadPhotoResponse uploadPhotoResponse = UploadPhotoResponse();
  //   String fileName = file!.path.split('/').last;
  //   print("filnename:$fileName");
  //   FormData formData = FormData.fromMap({
  //     "profile_image":
  //     await MultipartFile.fromFile(file.path, filename: fileName),
  //   });
  //   var response = await dio.post(
  //     uploadImageUrl,
  //     data: formData,
  //     options: Options(
  //         headers: {"Authorization": "Bearer ${Environment.accessToken}"},
  //         followRedirects: false,
  //         validateStatus: (status) {
  //           return status! < 500;
  //         }),
  //   );
  //   if (response.statusCode == 200) {
  //     uploadPhotoResponse = UploadPhotoResponse.fromJson(response.data);
  //     Fluttertoast.showToast(
  //         msg: "Image Uploaded Successfully",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: ColorTheme.themeGreenColor,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //
  //     print("upload api Called Successfully");
  //   }
  //   return uploadPhotoResponse;
  // }

  //Logout

  LogoutResponse _objLogoutResponse = LogoutResponse(data: []);

  LogoutResponse get objLogoutResponse => _objLogoutResponse;

  Future<LogoutResponse> getLogoutApi(BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      //  notifyListeners();
      final logoutResponse = await pullUpRepo.logoutRepo();
      _objLogoutResponse = logoutResponse;
      if (_objLogoutResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;
        notifyListeners();

        Fluttertoast.showToast(
            msg: "Logout successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);
        logoutClicked = false;
        Timer(
            const Duration(seconds: 0),
            () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login())));

        print("logout api Called Successfully");
      } else {
        isLoading = false;
        isError = false;
        logoutClicked = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      logoutClicked = false;
      notifyListeners();
      print("Exception:$e");
    }
    return _objLogoutResponse;
  }

  //Sos
  SosResponse _objSosResponse = SosResponse(data: SOSData());

  SosResponse get objSosResponse => _objSosResponse;

  Future<SosResponse> getSosApi(
      String lat, String long, BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      notifyListeners();
      final sosResponse = await pullUpRepo.sosRepo(lat, long, context);
      _objSosResponse = sosResponse;
      if (_objSosResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        Fluttertoast.showToast(
            msg: "${_objSosResponse.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);

        print("sos api Called Successfully");

        // Timer(
        //     const Duration(seconds: 0),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Login())));
      } else {
        isLoading = false;
        isError = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
      print("Exception:$e");
    }
    return _objSosResponse;
  }

  File? image1;
  File? image2;
  File? image3;
  File? image4;
  final picker1 = ImagePicker();
  final picker2 = ImagePicker();
  final picker3 = ImagePicker();
  final picker4 = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery1(ImageSource source) async {
    final pickedFile1 = await picker1.pickImage(source: source);

    // setState(() {
    if (pickedFile1 != null) {
      image1 = File(pickedFile1.path);
    }
    notifyListeners();
    // });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera1(ImageSource source) async {
    final pickedFile1 = await picker1.pickImage(source: source);

    // setState(() {
    if (pickedFile1 != null) {
      image1 = File(pickedFile1.path);
    }
    notifyListeners();
    //  });
  }

  //Image Picker function to get image from gallery
  Future getImageFromGallery2(ImageSource source) async {
    final pickedFile2 = await picker2.pickImage(source: source);

    //setState(() {
    if (pickedFile2 != null) {
      image2 = File(pickedFile2.path);
    }
    notifyListeners();
    // });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera2(ImageSource source) async {
    final pickedFile2 = await picker2.pickImage(source: source);

    // setState(() {
    if (pickedFile2 != null) {
      image2 = File(pickedFile2.path);
    }
    notifyListeners();
    // });
  }

  //Image Picker function to get image from gallery
  Future getImageFromGallery3(ImageSource source) async {
    final pickedFile3 = await picker3.pickImage(source: source);

    //setState(() {
    if (pickedFile3 != null) {
      image3 = File(pickedFile3.path);
    }
    notifyListeners();
    //});
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera3(ImageSource source) async {
    final pickedFile3 = await picker3.pickImage(source: source);

    // setState(() {
    if (pickedFile3 != null) {
      image3 = File(pickedFile3.path);
    }
    notifyListeners();
    //});
  }

  //Image Picker function to get image from gallery
  Future getImageFromGallery4(ImageSource source) async {
    final pickedFile4 = await picker4.pickImage(source: source);

    // setState(() {
    if (pickedFile4 != null) {
      image4 = File(pickedFile4.path);
    }
    notifyListeners();
    // });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera4(ImageSource source) async {
    final pickedFile4 = await picker4.pickImage(source: source);

    //setState(() {
    if (pickedFile4 != null) {
      image4 = File(pickedFile4.path);
    }
    notifyListeners();
    // });
  }

  //Step One Profile
  Future<StepOneResponse> stepOneApi(
      String name,
      String bio,
      String instaUrl,
      String youtubeUrl,
      String gender,
      String selectedCar,
      String selectedSuperCar,
      BuildContext context) async {
    StepOneResponse objStepOneResponse = StepOneResponse(data: StepOneData());
    String stepOneUrl = Environment.baseUrl + Environment.stepOneUrl;
    print("StepOne url:${stepOneUrl}");
    isLoading = true;
    isError = false;
    notifyListeners();
    try {
      final headers = {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${Environment.accessToken}'
      };

      var request = http.MultipartRequest('POST', Uri.parse(stepOneUrl));

      request.fields['name'] = name;
      request.fields['user_bio'] = bio;
      request.fields['instagram_url'] = instaUrl;
      request.fields['youtube_url'] = youtubeUrl;
      request.fields['gender'] = gender;
      request.fields['interested_car'] = selectedCar;
      request.fields['interested_supercar'] = selectedSuperCar;
      request.headers.addAll(headers);

      // if (image != null) {
      //   request.files.add(
      //       await http.MultipartFile.fromPath('document[]', uploadFileName));
      // }

      //  for (int i = 0; i < selectedImages.length; i++) {
      final f1 = await http.MultipartFile.fromPath('profile_one', image1!.path);
      final f2 = await http.MultipartFile.fromPath('profile_two', image2!.path);
      final f3 =
          await http.MultipartFile.fromPath('profile_three', image3!.path);
      final f4 =
          await http.MultipartFile.fromPath('profile_four', image4!.path);
      request.files.add(f1);
      request.files.add(f2);
      request.files.add(f3);
      request.files.add(f4);
      // }

      printStepOneParams(request);
      // var body = profileUpdateParams;
      // final encoding = Encoding.getByName('utf-8');

      // print("profileUpdateParams :$body ");

      // final response = await http.post(Uri.parse(profileUpdateUrl),
      //     body: body, headers: headers);

      final response = await request.send();
      var res = await http.Response.fromStream(response);

      // print("profile update body:${response.body}");

      int statusCode = res.statusCode;
      print("step one statusCode: ${res.statusCode}");

      if (statusCode == 200) {
        // var data = await jsonDecode(response.body);
        // print("profileupdate_data:$data");
        objStepOneResponse = StepOneResponse.fromJson(jsonDecode(res.body));

        print("objStepOneResponse${objStepOneResponse.data}");
        isLoading = false;
        isSuccess = true;
        isError = true;

        notifyListeners();
        //  isRateWashSubmit = false;

        Fluttertoast.showToast(
            msg: "${objStepOneResponse.message}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorTheme.themeGreenColor,
            textColor: Colors.white,
            fontSize: 16.0);

        print("Step one api  submitted Successfully");

        Timer(
            const Duration(seconds: 1),
            () => Navigator.of(context).push(PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CreateProfileStepTwo(),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return new SlideTransition(
                    position: new Tween<Offset>(
                      //Left to right
                      // begin: const Offset(
                      //     -1.0, 0.0),
                      // end: Offset.zero,

                      //Right to left
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,

                      //top to bottom
                      // begin: const Offset(0.0, -1.0),
                      // end: Offset.zero,

                      //   bottom to top
                      // begin: Offset(0.0, 1.0),
                      // end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                }
                // transitionsBuilder: (context, animation, secondaryAnimation, page) {
                //   var begin = 0.0;
                //   var end = 1.0;
                //   var curve = Curves.ease;
                //
                //   var tween =
                //   Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                //   return ScaleTransition(
                //     scale: animation.drive(tween),
                //     child: page,
                //   );
                // },
                )));
        return objStepOneResponse;
      } else if (statusCode == 500) {
        isLoading = false;
        isError = false;
        //isRateWashSubmit = false;
        notifyListeners();

        Fluttertoast.showToast(
            msg: "Something went wrong.Please try again!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      isLoading = false;
      isError = true;
      // isRateWashSubmit = false;
      notifyListeners();
      print("Exception:$e");
    }

    return objStepOneResponse;
  }

  void printStepOneParams(http.MultipartRequest request) {
    request.fields.forEach((key, value) {
      print("Step One Params $key:$value");
    });
  }

  //matched profile

  MatchedProfileResponse _objMatchedProfileResponse =
      MatchedProfileResponse(data: []);

  MatchedProfileResponse get objMatchedProfileResponse =>
      _objMatchedProfileResponse;

  Future<MatchedProfileResponse> getMatchedProfileApi(
      BuildContext context) async {
    try {
      isLoading = true;
      isError = false;
      //  notifyListeners();
      final matchedProfileResponse = await pullUpRepo.matchedProfileRepo();
      _objMatchedProfileResponse = matchedProfileResponse;
      if (_objMatchedProfileResponse.status == 200) {
        isLoading = false;
        isSuccess = true;
        isError = true;
        notifyListeners();

        // Fluttertoast.showToast(
        //     msg: "Logout successfully",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: ColorTheme.themeGreenColor,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        //
        // Timer(
        //     const Duration(seconds: 0),
        //         () => Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Login())));

        print("MatchedProfile api Called Successfully");
      } else {
        isLoading = false;
        isError = false;

        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      isError = true;

      notifyListeners();
      print("Exception:$e");
    }
    return _objMatchedProfileResponse;
  }
}
