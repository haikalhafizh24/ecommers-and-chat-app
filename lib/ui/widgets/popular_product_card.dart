import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class PopularProductCard extends StatelessWidget {
  final String imageUrl;
  final String tittle;
  final String category;
  final String price;
  const PopularProductCard({
    Key? key,
    required this.imageUrl,
    required this.tittle,
    required this.category,
    required this. price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.5),
      margin: EdgeInsets.only(right: defaultMargin,top: 15),
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
              image:  DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            tittle,
            overflow: TextOverflow.clip,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          Text(
            category,
            style: greyTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            price,
            style: blueTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
