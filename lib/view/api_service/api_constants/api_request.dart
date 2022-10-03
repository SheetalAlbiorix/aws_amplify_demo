import 'package:get/get.dart';

import '../../utils/base_constant/base_constants.dart';
/*import 'package:my_village/view/utils/base_constant/base_constants.dart';*/

class ApiRequest extends GetConnect {
  final String? url;
  final Map? data;

  ApiRequest({
    this.url,
    this.data,
  });

  Response onResponse(Response response) {
    if (response.status.connectionError) {
      throw Exception(BaseStrings.noInternetConnection);
    } else if (response.status.isServerError) {
      throw Exception(BaseStrings.serverIsNotAvailableYet);
    } else if (response.status.code == 400) {
      throw Exception(BaseStrings.somethingWentWrong);
    }
    return response;
  }
}
