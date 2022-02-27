import 'package:eighty_three/src/controllers/home_controller.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../models/response/house_response_model.dart';
import '../utils/app_theme.dart';
import '../widgets/house_item.dart';
import '../widgets/icon_container.dart';
import 'house_details.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    IconContainer(icon: Icon(Icons.api_sharp)),
                    IconContainer(icon: Icon(Icons.api_sharp))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Neumorphic(
                  style: const NeumorphicStyle(
                    border: NeumorphicBorder(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.home,
                            color: AppTheme.smallIconColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search Houses",
                            style: TextStyle(color: AppTheme.smallIconColor),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.mic,
                        color: AppTheme.smallIconColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Houses",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "in New York",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {

                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HouseDetails(house:controller.data.value.data[index]),
                          ));
                        },
                        child: HouseItem(
                          house: controller.data.value.data[index],
                        ),
                      ),
                      separatorBuilder: (c, x) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: controller.data.value.data.length,
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
