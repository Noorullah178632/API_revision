import 'package:api_revision/data/response/api_response.dart';
import 'package:api_revision/models/getApi_model.dart';
import 'package:api_revision/repository/get_api_data.dart';
import 'package:flutter/material.dart';

class GetApiViewModel extends ChangeNotifier {
  //make a instance of repository clas
  GetApiRepository repository = GetApiRepository();
  //for loading we will use the status class of the data folder

  ApiResponse<List<GetApiModel>> responseData = ApiResponse.loading();
  void setStateApi(ApiResponse<List<GetApiModel>> res) {
    responseData = res;
    notifyListeners();
  }

  Future<void> getApiData() async {
    setStateApi(ApiResponse.loading());
    await repository
        .getAPi()
        .then((value) {
          setStateApi(ApiResponse.completed(value));
        })
        .onError((error, stack) {
          setStateApi(ApiResponse.error(error.toString()));
        });
  }
}
