import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ivolunteer/src/models/LoginStatus.dart';
import 'package:ivolunteer/src/values/Constants.dart';

import 'app_exceptions.dart';

class ApiBaseHelper {
  static Future<LoginStatus> loginUser(String mail, String pasword) async {
//    var encoded = Uri.encodeFull('GET_LOGIN?sop=${Constants.SOP}&lang=en&TB_EMAIL=${mail}&TB_PASSWORD=${pasword}&TB_DEVICE=Android&TB_UDID=');
    var response = await get(
        'GET_LOGIN?sop=${Constants
            .SOP}&lang=en&TB_EMAIL=${mail}&TB_PASSWORD=${pasword}&TB_DEVICE=Android&TB_UDID=');

    print(response);

    return LoginStatus.fromJson(response);
  }


  static Future<dynamic> get(String url) async {
    try {
    var responseJson;
    print(Constants.BASEURL + url);
    var encoded = Uri.encodeFull(Constants.BASEURL + url);
    print(encoded);
    final response = await http.get(encoded);
    responseJson = _returnResponse(response);
    return responseJson;
    } on SocketException {
    throw FetchDataException('No Internet connection');
    }
  }

  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw Exception(
            'Error occured while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }
}
