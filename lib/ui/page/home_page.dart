import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/category_item.dart';
import 'package:storma/ui/widgets/new_arrivals_item.dart';
import 'package:storma/ui/widgets/popular_product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo, Mark',
                style: whiteTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              Text(
                '@markClint',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              )
            ],
          ),
          Container(
            height: 54,
            width: 54,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/user_image.png'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget searchField() {
    return Container(
      margin: const EdgeInsets.only(
        right: 15,
        left: 15,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: cBgColor2),
        child: Row(
          children: [
            Image.asset(
              'assets/Union.png',
              width: 16,
              height: 18,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextFormField(
                style: whiteTextStyle,
                cursorColor: cBlueColor,
                decoration: InputDecoration(
                  hintText: 'Search product',
                  hintStyle: greyTextStyle,
                  focusedBorder: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget category() {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            SizedBox(width: 15),
            CategoryItem(
              tittle: 'All Shoes',
              index: true,
            ),
            CategoryItem(
              tittle: 'Running',
            ),
            CategoryItem(
              tittle: 'Training',
            ),
            CategoryItem(
              tittle: 'Basketball',
            ),
            CategoryItem(
              tittle: 'Hiking',
            ),
          ],
        ),
      ),
    );
  }

  Widget popularProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, left: defaultMargin),
          child: Text(
            'Popular Products',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 22,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              SizedBox(width: 15),
              PopularProductCard(
                imageUrl: 'assets/shoes_image.png',
                tittle: 'Adidas Ultraboost 2.0',
                category: 'Sneakers',
                price: '\$ 67.05',
              ),
              PopularProductCard(
                imageUrl: 'assets/shoes_image.png',
                tittle: 'Adidas Ultraboost 2.0',
                category: 'Sneakers',
                price: '\$ 67.05',
              ),
              PopularProductCard(
                imageUrl: 'assets/shoes_image.png',
                tittle: 'Adidas Ultraboost 2.0',
                category: 'Sneakers',
                price: '\$ 67.05',
              ),
              PopularProductCard(
                imageUrl: 'assets/shoes_image.png',
                tittle: 'Adidas Ultraboost 2.0',
                category: 'Sneakers',
                price: '\$ 67.05',
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget newArrivalsProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
          ),
          child: Text(
            'New Arrivals',
            style: whiteTextStyle.copyWith(
              fontSize: 22,
              fontWeight: semiBold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 15,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Column(
            children: const [
              NewArrivalsItem(
                imageUrl: 'assets/shoes_image.png',
                tittle: 'Adidas Yeezy',
                category: 'Running',
                price: '\$47. 80',
              ),
              NewArrivalsItem(
                imageUrl: 'assets/shoes_image.png',
                tittle: 'Adidas Yeezy',
                category: 'Running',
                price: '\$47. 80',
              ),
              NewArrivalsItem(
                imageUrl: 'assets/shoes_image.png',
                tittle: 'Adidas Yeezy',
                category: 'Running',
                price: '\$47. 80',
              ),
              NewArrivalsItem(
                imageUrl: 'assets/shoes_image.png',
                tittle: 'Adidas Yeezy',
                category: 'Running',
                price: '\$47. 80',
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor1,
      body: ListView(
        children: [
          header(),
          searchField(),
          category(),
          popularProducts(),
          newArrivalsProduct(),
        ],
      ),
    );
  }
}
