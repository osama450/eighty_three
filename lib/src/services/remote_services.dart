
import 'package:dio/dio.dart';
import 'package:eighty_three/src/models/response/house_response_model.dart';
import 'package:eighty_three/src/view/utils/apis.dart';
import 'package:get/get.dart';

class RemoteServices {
   final client = Dio();

   Future<HouseResponseModel?> fetchHouses() async {
    var response = await client.get(Apis().HOME_API);
    try{

      if (response.statusCode == 200) {
        var jsonString = response.data;
        return HouseResponseModel.fromJson(jsonString);
      } else {

        return null;
      }
    }catch(e){
      Get.showSnackbar(GetSnackBar(title: e.toString(),));
    }
  }
}
