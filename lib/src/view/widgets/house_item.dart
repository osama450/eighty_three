import 'package:eighty_three/src/models/response/house_response_model.dart';
import 'package:flutter/material.dart';

import '../screens/house_details.dart';
import '../utils/app_theme.dart';

class HouseItem extends StatelessWidget {
  final Datum house;

  const HouseItem({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          color: Color(0xffF0F1F6),
          border: Border.all(color: Colors.white54),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,5),
              blurRadius: 20,
              color: Colors.black12.withOpacity(0.05)
            )
          ]
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  house.image,
                  height: size.height * 0.12,
                  fit: BoxFit.cover,
                  width: size.width * 0.250,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$${house.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.home,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        house.city,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Flex(

                    direction: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.bed,
                            size: 18,
                            color: AppTheme.smallIconColor,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text("${house.bedCount}"),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.bed,
                            size: 18,
                            color: AppTheme.smallIconColor,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text("${house.boll}"),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.stream,
                            size: 18,
                            color: AppTheme.smallIconColor,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text("${house.area}"),
                        ],
                      ),
                    ],

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
