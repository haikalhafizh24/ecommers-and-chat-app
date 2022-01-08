import 'package:storma/models/product_model.dart';

class MessageModel {
  late String message;
  late int userId;
  late String username;
  late String userImage;
  late bool isFromUser;
  late ProductModel product;
  late DateTime createdAt;
  late DateTime updatedAt;

  MessageModel({
    required this.message,
    required this.userId,
    required this.username,
    required this.userImage,
    required this.isFromUser,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    username = json['username'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];
    product = json['product'].isEmpty
        ? UninitializeProductModel()
        : ProductModel.fromJson(json['product']);
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> tojson() {
    return {
      'message': message,
      'userId': userId,
      'username': username,
      'userImage': userImage,
      'isFtomUser': isFromUser,
      'product': product is UninitializeProductModel ? {} : product.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
