import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ivolunteer/src/values/Constants.dart';

import 'app_exceptions.dart';

class ApiBaseHelper {
  static Future<dynamic> loginUser(String mail, String pasword) async {
    var response = await get(
        'GET_LOGIN?sop=${Constants.SOP}&lang=en&TB_EMAIL=$mail&TB_PASSWORD=$pasword&TB_DEVICE=Android&TB_UDID=');
    print(response);
  }

  static Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Constants.BASEURL + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
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
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
