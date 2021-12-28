import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/product_model.dart';
import 'package:storma/providers/wishlist_provider.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/page/product_page.dart';

class WishlistTile extends StatelessWidget {
  final ProductModel product;
  const WishlistTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product: product),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: cBgColor4,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(product.galleries[0].url),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: whiteTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$ ${product.price}',
                        style: blueTextStyle.copyWith(
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    wishlistProvider.setProduct(product);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Icon(
                      Icons.favorite,
                      color: cRedColor,
                      size: 22,
                    ),
                    // Image.asset(
                    //   'assets/Love_icon.png',
                    //   color: cRedColor,
                    //   width: 22,
                    // ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: cPrimaryColor),
                    child: Center(
                      child: Text('Add to chart',
                          style:
                              bgColor4TextStyle.copyWith(fontWeight: medium)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
