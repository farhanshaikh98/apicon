import 'dart:convert';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/strings.dart';
import '../constants/urls.dart';

import 'package:http/http.dart';

class APIResponse {
  APIResponse(Map<String, dynamic> value) {
    success = value['status'] as bool;
    message = value['message:'] as String;
    data = value['data'];
  }

  bool? success;
  String? message;
  dynamic data;
}

class APIManager {
  static Future<APIResponse> postResponse(String path, dynamic params) async {
    if (await isNetworkReachable()) {
      final Response response = await post(
        Uri.parse(Url.baseUrl + path),
        body: params,
      );
      debugPrint('api - ${Url.baseUrl + path}');
      debugPrint('params - $params');

      debugPrint('response - ${response.body}');
      return formatResponse(response: response, apiType: true);
    } else {
      return APIResponse(ReusableString.networkErrorRes);
    }
  }

  static Future<bool> isNetworkReachable() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        return true;
      }
    } on SocketException catch (_) {
      debugPrint('not connected');
      Fluttertoast.showToast(
        msg: ReusableString.connectionMsg,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 16.0,
      );
      return false;
    }
    return false;
  }

  static APIResponse formatResponse(
      {required Response response, required bool apiType}) {
    switch (response.statusCode) {
      case 200:
        if (apiType) {
          return APIResponse({
            'status': true,
            'message:': 'successful',
            'data': jsonDecode(response.body)
          });
        }
        return APIResponse(jsonDecode(response.body) as Map<String, dynamic>);
      case 400:
        return APIResponse(<String, dynamic>{
          'status': false,
          'message:': '** 400: Bad Request Exception **${response.body}'
        });
      case 401:
      case 403:
        return APIResponse(<String, dynamic>{
          'status': false,
          'message:': '401/403: Unauthorized Exception ${response.body}'
        });
      case 500:
      default:
        return APIResponse(<String, dynamic>{
          'status': false,
          'message:':
              '** Fetch Data Exception - Error occurred while Communication with Server with StatusCode: ${response.statusCode}'
        });
    }
  }
}
