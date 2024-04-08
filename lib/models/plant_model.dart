import 'package:cloud_firestore/cloud_firestore.dart';

class PlantModel {
  String? plantId;
  num? price;
  String? size;
  String? humidity;
  String? temperature;
  String? category;
  String? name;
  String? image;
  bool isFavorated = false;
  String? decription;
  bool isCart = false;

  DocumentReference<Map<String, dynamic>>? ref;

  PlantModel(
      {required this.plantId,
      required this.name,
      required this.price,
      required this.size,
      required this.image,
      required this.humidity,
      required this.temperature,
      required this.category,
      required this.decription,
      });

  PlantModel.fromJson(Map<String, dynamic>? json,
      {this.isFavorated = false, this.isCart = false}) {
    plantId = json!['plantId'];
    price = json['price'];
    category = json['category'];
    name = json['plantName'];
    size = json['size'];
    decription = json['decription'];
    humidity = json['humidity'];
    temperature = json['temperature'];
    image = json['imageURL'];
    ref = json['ref'];
  }

  Map<String, dynamic> toMap() => {
        'plantId': plantId,
        'plantName': name,
        'category': category,
        'price': price,
        'size': size,
        'decription': decription,
        'humidity': humidity,
        'temperature': temperature,
        'imageURL': image,
        'ref': ref,
      };
}
