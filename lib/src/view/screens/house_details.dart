import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/response/house_response_model.dart';
import '../utils/app_theme.dart';
import '../widgets/icon_container.dart';

class HouseDetails extends StatelessWidget {
  final Datum house;
  const HouseDetails({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(house.image, fit: BoxFit.cover),
          buildImageDetails(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHouseDetails(),
                      const SizedBox(
                        height: 10,
                      ),
                      buildOwner(context),
                      const SizedBox(
                        height: 25,
                      ),
                      buildCheckOutButtons(context)
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column buildHouseDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          house.city,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Detail Oriented House",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.bed,
                  size: 28,
                  color: AppTheme.smallIconColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text("${house.bedCount}"),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.bed,
                  size: 28,
                  color: AppTheme.smallIconColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text("${house.boll}"),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.stream,
                  size: 28,
                  color: AppTheme.smallIconColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text("${house.area}"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Column buildImageDetails(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const IconContainer(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Opacity(
            opacity: 0.6,
            child: Container(
              height: 100,
              width: 120,
              decoration:  BoxDecoration(

    color: Colors.grey.shade200.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.send_sharp,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '3D TOUER',
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Row buildCheckOutButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$${house.price}",
          style: Theme.of(context).textTheme.headline6,
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color(0xff1358E9),
              borderRadius: BorderRadius.circular(20)),
          child: const Text(
            "BOOK A House",
            style:
                TextStyle(letterSpacing: 3, color: Colors.white, fontSize: 14),
          ),
        )
      ],
    );
  }

  Container buildOwner(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          border: Border.all(color: Colors.white54),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 20,
                color: Colors.black12.withOpacity(0.05))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        house.image,
                        height: 55,
                        width: 55,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alyssa Watson",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "OWNER",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.indigo, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                const IconContainer(
                    icon: Icon(
                  Icons.phone,
                  size: 20,
                  color: Colors.indigo,
                ))
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "Custom- build kitchenes Custom- build kitchenes Custom- build kitchenes Custom- build kitchenes Custom- build kitchenes Custom- build kitchenes Custom- build kitchenes",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
