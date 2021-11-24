import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor3,
      appBar: AppBar(
        backgroundColor: cBgColor1,
        title: Text(
          'Your Cart',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
