import 'dart:core';

import 'package:api_revision/models/user_token_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTokenViewModel extends ChangeNotifier {
  //save user in sharedpreference
  Future<bool> setUserToken(TokenModel token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token.accessToken.toString());
    notifyListeners();
    return true;
  }

  //get user in sharedpreference
  Future<TokenModel> getUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    return TokenModel(accessToken: token);
  }

  //remove user form sharedpreference
  Future<bool> clearUsers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    return true;
  }
}
