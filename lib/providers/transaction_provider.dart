import 'package:flutter/cupertino.dart';
import 'package:storma/models/cart_model.dart';
import 'package:storma/services/transacton_services.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
  ) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
