import 'package:flutter/material.dart';
import 'package:storma/models/product_model.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/page/product_page.dart';

class PopularProductCard extends StatelessWidget {
  final ProductModel product;
  const PopularProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(12.5),
        margin: EdgeInsets.only(right: defaultMargin, top: 15),
        width: 215,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: cBgColor2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                  image: NetworkImage(product.galleries[0].url),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              product.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Text(
              product.category.name,
              style: greyTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '\$${product.price}',
              style: blueTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
