
import 'package:eighty_three/src/models/response/house_response_model.dart';
import 'package:get/get.dart';
import '../services/remote_services.dart';

class HomeController extends GetxController{
  Rx<HouseResponseModel>  data = HouseResponseModel(data: []).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    _fetchHouses();
    super.onInit();
  }

  Future<void> _fetchHouses() async {
    try {
      isLoading(true);
      var houses = await RemoteServices().fetchHouses();
      if (houses != null) {
        data.value = houses;
      }
    } finally {
      isLoading(false);
    }
  }
}