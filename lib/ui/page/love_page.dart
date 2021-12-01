import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/custom_button.dart';
import 'package:storma/ui/widgets/wishlist_tile.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: cBgColor1,
        centerTitle: true,
        title: Text(
          'Wishlist Shoes',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget emptyWishlist() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/love_image.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your wishlist is Empty',
              style: whiteTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Let\'s add item to your wishlist!',
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
            WishlistTile(
              imageUrl: 'assets/shoes_image.png',
              tittle: 'Adidas Ultraboost 2.0',
              price: '\$ 76. 98',
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        child: header(),
        preferredSize: const Size.fromHeight(60),
      ),
      backgroundColor: cBgColor1,
      body: content(),
    );
  }
}
