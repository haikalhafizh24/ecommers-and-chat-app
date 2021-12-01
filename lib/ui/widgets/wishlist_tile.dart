import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class WishlistTile extends StatelessWidget {
  final String imageUrl;
  final String tittle;
  final String price;
  const WishlistTile({
    Key? key,
    required this.imageUrl,
    required this.tittle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    image: AssetImage(imageUrl),
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
                      tittle,
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
                      price,
                      style: blueTextStyle.copyWith(
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only( bottom: 20),
                child: Image.asset(
                  'assets/Love_icon.png',
                  color: cRedColor,
                  width: 22,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5,),
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: cPrimaryColor),
                  child: Center(
                    child: Text(
                      'Add to chart',
                      style: bgColor4TextStyle.copyWith(fontWeight: medium)
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
