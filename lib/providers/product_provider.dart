import 'package:flutter/cupertino.dart';
import 'package:storma/models/product_model.dart';
import 'package:storma/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  late List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  List<ProductModel>? _filterProduct;
  List<ProductModel>? get filterProduct => _filterProduct;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void searchProduct(String keyword) async {
    if (keyword.isNotEmpty) {
      _filterProduct = products
          .where(
            (element) => element.name.toLowerCase().contains(
                  keyword.toLowerCase(),
                ),
          )
          .toList();
    } else {
      _filterProduct = null;
    }
    notifyListeners();
  }

  void deleteSearchHistory() {
    _filterProduct = null;
    notifyListeners();
  }
}
