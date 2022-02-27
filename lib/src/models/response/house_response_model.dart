
class HouseResponseModel {
  HouseResponseModel({
    required this.data,
  });

  final List<Datum> data;

  factory HouseResponseModel.fromJson(Map<String, dynamic> json) => HouseResponseModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.image,
    required this.area,
    required this.bedCount,
    required this.boll,
    required this.city,
    required this.price,
  });

  final String id;
  final String image;
  final String area;
  final String bedCount;
  final String boll;
  final String city;
  final String price;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    image: json["image"],
    area: json["area"],
    bedCount: json["bedCount"],
    boll: json["boll"],
    city: json["city"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "area": area,
    "bedCount": bedCount,
    "boll": boll,
    "city": city,
    "price": price,
  };
}
