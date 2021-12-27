import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/user_model.dart';
import 'package:storma/providers/auth_provider.dart';
import 'package:storma/providers/product_provider.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/category_item.dart';
import 'package:storma/ui/widgets/new_arrivals_item.dart';
import 'package:storma/ui/widgets/popular_product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

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
                  'Hallo, ${user.name}',
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  '@${user.username}',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                )
              ],
            ),
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    user.profilePhotoUrl,
                  ),
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
            child:
                // GridView(
                //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //       maxCrossAxisExtent: 200,
                //       crossAxisSpacing: 10,
                //       mainAxisSpacing: 10),
                //   scrollDirection: Axis.horizontal,
                //   padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                //   children: productProvider.products
                //       .map(
                //         (product) => PopularProductCard(
                //           product: product,
                //         ),
                //       )
                //       .toList(),
                // )
                Row(
              children: productProvider.products
                  .map(
                    (product) => PopularProductCard(
                      product: product,
                    ),
                  )
                  .toList(),
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
              children: productProvider.products
                  .map(
                    (product) => NewArrivalsItem(
                      product: product,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    }

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
