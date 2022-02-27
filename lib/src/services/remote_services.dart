
import 'package:dio/dio.dart';
import 'package:eighty_three/src/models/response/house_response_model.dart';
import 'package:eighty_three/src/view/utils/apis.dart';

class RemoteServices {
  static var client = Dio();

  static Future<HouseResponseModel?> fetchHouses() async {
    var response = await client.get(Apis.HOME_API);
    if (response.statusCode == 200) {
      var jsonString = response.data;
      return HouseResponseModel.fromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
