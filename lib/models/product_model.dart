import 'package:storma/models/category_model.dart';
import 'package:storma/models/gallery_model.dart';

class ProductModel {
  late int id;
  late String name;
  late double price;
  late String description;
  late String tags;
  late CategoryModel category;
  late DateTime createdAt;
  late DateTime updatedAt;
  late List<GalleryModel> galleries;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'] ?? "";
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

class UninitializeProductModel extends ProductModel {
  UninitializeProductModel()
      : super(
          id: 0,
          name: "",
          price: 0,
          description: "",
          tags: "",
          category: CategoryModel(
            id: 0,
            name: "",
          ),
          galleries: List.empty(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
}
