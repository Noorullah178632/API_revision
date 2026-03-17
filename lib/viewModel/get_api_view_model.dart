import 'package:api_revision/data/response/api_response.dart';
import 'package:api_revision/repository/get_api_data.dart';
import 'package:flutter/material.dart';

class GetApiViewModel extends ChangeNotifier {
  //make a instance of repository clas
  GetApiRepository repository = GetApiRepository();
  //for loading we will use the status class of the data folder

  ApiResponse<dynamic> responseState = ApiResponse.loading();
  void setState(ApiResponse<dynamic> res) {
    responseState = res;
    notifyListeners();
  }

  Future<void> getApiData() async {
    setState(ApiResponse.loading());

    repository
        .getAPi()
        .then((value) {
          setState(ApiResponse.completed(value));
        })
        .onError((error, stack) {
          setState(ApiResponse.error(error.toString()));
        });
  }
}
