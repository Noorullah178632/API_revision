import 'package:api_revision/utils/RoutesFolder/routes_name.dart';
import 'package:api_revision/viewModel/user_token_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashServices {
  Future<void> currentUserAuthentication(BuildContext context) async {
    UserTokenViewModel()
        .getUserToken()
        .then((value) {
          if (value.accessToken == "null" ||
              value.accessToken == "" ||
              value.accessToken == null) {
            Future.delayed(Duration(seconds: 3));
            Navigator.pushNamed(context, RoutesName.login);
          } else {
            Future.delayed(Duration(seconds: 3));
            Navigator.pushNamed(context, RoutesName.home);
          }
        })
        .onError((error, stackError) {
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
