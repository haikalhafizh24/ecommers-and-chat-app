import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/providers/cart_provider.dart';
import 'package:storma/providers/page_provider.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/cart_tile.dart';
import 'package:storma/ui/widgets/custom_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

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
              margin: const EdgeInsets.only(left: 25),
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/empty_cart.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your Cart is Empty',
              style: whiteTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Add item to your cart!',
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              tittle: 'Add Product',
              width: 153,
              onTap: () {
                pageProvider.currentIndex = 0;
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
          children:
              cartProvider.carts.map((cart) => CartTile(cart: cart)).toList(),
        ),
      );
    }

    Widget actionButton() {
      return Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        color: cBgColor1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Amount',
                  style: whiteTextStyle,
                ),
                Text(
                  '\$ ${cartProvider.totalPrice()}',
                  style: blueTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            CustomButton(
              color: cPrimaryColor,
              width: 150,
              tittle: 'Checkout',
              onTap: () {
                Navigator.pushNamed(context, '/checkout');
              },
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
      body: cartProvider.carts.isEmpty ? emptyCart() : content(),
      bottomNavigationBar:
          cartProvider.carts.isEmpty ? const SizedBox() : actionButton(),
    );
  }
}
