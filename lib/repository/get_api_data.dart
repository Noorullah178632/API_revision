import 'package:api_revision/data/network/base_api_services.dart';
import 'package:api_revision/data/network/network_api_services.dart';
import 'package:api_revision/models/getApi_model.dart';
import 'package:api_revision/resources/app_url.dart';

class GetApiRepository {
  BaseApiServices services = NetworkApiServices();

  Future<List<GetApiModel>> getAPi() async {
    final reponse = await services.getGetApiServices(AppUrl.getDataUrl);
    return (reponse as List)
        .map((value) => GetApiModel.fromJson(value))
        .toList();
  }
}
