import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/providers/wishlist_provider.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/custom_button.dart';
import 'package:storma/ui/widgets/wishlist_tile.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

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
          children: wishlistProvider.wishlist
              .map((product) => WishlistTile(
                    product: product,
                  ))
              .toList(),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        child: header(),
        preferredSize: const Size.fromHeight(60),
      ),
      backgroundColor: cBgColor1,
      body: wishlistProvider.wishlist.isEmpty ? emptyWishlist() : content(),
    );
  }
}
