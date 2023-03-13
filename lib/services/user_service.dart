import 'dart:convert';

import 'package:demo_test/services/api_manager.dart';

import '../constants/urls.dart';

class APIService {
  static final APIService _singleton = APIService._internal();

  factory APIService() {
    return _singleton;
  }

  APIService._internal();

  // User Login function
  static Future<APIResponse> login(String userName, String pwd) async {
    final APIResponse resp = await APIManager.postResponse(
        Url.signupEndpointAPI,
        jsonEncode(<String, String>{
          'email': userName.trim(),
          'password': pwd.trim(),
        }));
    return resp;
  }

  // User Login function
  static Future<APIResponse> Signup(
      String userName,
      String email,
      String pass,
      String phone,
      String occu,
      String address,
      String city,
      String country,
      String stste) async {
    final APIResponse resp = await APIManager.postResponse(
        Url.signupEndpointAPI,
        jsonEncode(<String, String>{
          'userName': userName.trim(),
          'email': email.trim(),
          'password': pass.trim(),
          'phoneNumber': phone.trim(),
          'occupation': occu.trim(),
          'address ': address.trim(),
          'city': city.trim(),
          'country': country.trim(),
          'state': stste.trim(),
        }));
    return resp;
  }
}
