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
      backgroundColor: Color(0xffEFF0F5),
      body: Stack(
        children: [

          Positioned(
              right: 0,
              child: Container(
                width: 110,
                height: 230,
                decoration: const BoxDecoration(
                    color: Color(0xffD9DEEF),
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40))),
              )),
          Positioned(
              right: 0,
              child: Container(
                width: 90,
                height: 250,
                decoration: const BoxDecoration(
                    color: Color(0xff255ED6),
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40))),
              )),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _appBar(),
                    const SizedBox(
                      height: 50,
                    ),
                    _buildSearchBar(),
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
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildObx()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Obx _buildObx() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.to(HouseDetails(house: controller.data.value.data[index]),);
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
    });
  }

  TextFormField _buildSearchBar() {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: const Color(0xffEFF0F5),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        hintText: "Search Houses",
        prefixIcon: const Icon(
          Icons.home_outlined,
          color: AppTheme.smallIconColor,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: const Icon(
          Icons.mic_none,
          color: Colors.grey,
        ),
      ),
    );
  }

  Row _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        IconContainer(
            icon: Icon(
          Icons.filter_list_rounded,
          color: Colors.grey,
        )),
        IconContainer(
            icon: Icon(
          Icons.menu_outlined,
          color: Colors.grey,
        ))
      ],
    );
  }
}
