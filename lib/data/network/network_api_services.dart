import 'dart:convert';

import 'package:api_revision/data/appException/app_exceptions.dart';
import 'package:api_revision/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  getGetApiServices(String url) {}

  @override
  getPostApiServices(String url, data) {}

  //make a dynamic function to handle the exception of status code
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 201:
        dynamic jsonResponse = jsonDecode(response.body);

        return jsonResponse;
      case 400:
        return BadRequestException(response.body.toString());
      case 500:
        return FetchDataException("Server Error :");
      default:
        throw FetchDataException("Error :${response.statusCode}");
    }
  }
}
