import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/cart_tile.dart';
import 'package:storma/ui/widgets/custom_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: cBgColor1,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/emptyCart_icon.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your Card is Empty',
              style: whiteTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Add item to your card!',
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              tittle: 'Add Product',
              width: 153,
              onTap: () {
                Navigator.pushNamed(context, '/main-page');
              },
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 25,
        ),
        child: Column(
          children: const [
            CartTile(
              imageUrl: 'assets/shoes_image.png',
              tittle: 'Adidas Ultraboost 2.0',
              price: '\$ 76. 98',
            ),
            CartTile(
              imageUrl: 'assets/shoes_image.png',
              tittle: 'Adidas Ultraboost 2.0',
              price: '\$ 76. 98',
            ),
            CartTile(
              imageUrl: 'assets/shoes_image.png',
              tittle: 'Adidas Ultraboost 2.0',
              price: '\$ 76. 98',
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: cBgColor3,
      appBar: PreferredSize(
        child: header(),
        preferredSize: const Size.fromHeight(60),
      ),
      body: content(),
    );
  }
}
