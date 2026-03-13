import 'package:api_revision/data/network/base_api_services.dart';
import 'package:api_revision/data/network/network_api_services.dart';
import 'package:api_revision/resources/app_url.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  final BaseApiServices _services = NetworkApiServices();

  Future<dynamic> loginUser(dynamic data) async {
    try {
      final response = await _services.getPostApiServices(
        AppUrl.loginEndPointUrl,
        data,
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
    }
  }

  Future<dynamic> registerUser(dynamic data) async {
    try {
      final response = await _services.getPostApiServices(
        AppUrl.registerEndPointUrl,
        data,
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("error: ${e.toString()}");
      }
    }
  }
}
