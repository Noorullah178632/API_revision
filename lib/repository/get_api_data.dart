import 'package:api_revision/data/network/base_api_services.dart';
import 'package:api_revision/data/network/network_api_services.dart';
import 'package:api_revision/resources/app_url.dart';

class GetApiRepository {
  BaseApiServices services = NetworkApiServices();

  Future<dynamic> getAPi() async {
    final reponse = await services.getGetApiServices(
      AppUrl.getDataUrl.toString(),
    );
    return reponse;
  }
}
