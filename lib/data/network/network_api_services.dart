import 'dart:convert';
import 'dart:io';

import 'package:api_revision/data/appException/app_exceptions.dart';
import 'package:api_revision/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  getGetApiServices(String url) async {
    dynamic jsonDecode;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
      jsonDecode = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return jsonDecode;
  }

  @override
  getPostApiServices(String url, data) async {
    dynamic jsonDecode;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      jsonDecode = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet Exception");
    }
    return jsonDecode;
  }

  //make a dynamic function to handle the exception of status code
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException("Error :${response.statusCode}");
    }
  }
}
