import 'package:flutter/material.dart';
import 'package:storma/models/product_model.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/page/product_page.dart';

class NewArrivalsItem extends StatelessWidget {
  final ProductModel product;
  const NewArrivalsItem({
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
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    image: DecorationImage(
                      image: NetworkImage(
                        product.galleries[0].url,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      overflow: TextOverflow.clip,
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
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              margin: const EdgeInsets.symmetric(vertical: 15),
              color: cDeactiveColor,
            )
          ],
        ),
      ),
    );
  }
}
