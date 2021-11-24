import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class NewArrivalsItem extends StatelessWidget {
  final String imageUrl;
  final String tittle;
  final String category;
  final String price;
  const NewArrivalsItem({
    Key? key,
    required this.imageUrl,
    required this.tittle,
    required this.category,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    image: AssetImage(imageUrl),
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
    );
  }
}
