import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              iconSize: 48,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.chevron_left,
                color: cBgColor1,
              ),
            ),
            Image.asset(
              'assets/Cart_icon.png',
              width: 22,
              color: cBgColor1,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
        ],
      );
    }

    return Scaffold(
      backgroundColor: cWhiteColor,
        body: Column(
      children: [
        header(),
        content(),
      ],
    ));
  }
}
