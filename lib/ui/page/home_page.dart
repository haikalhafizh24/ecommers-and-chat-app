import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/product_model.dart';
import 'package:storma/models/user_model.dart';
import 'package:storma/providers/auth_provider.dart';
import 'package:storma/providers/product_provider.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/page/search_page.dart';
import 'package:storma/ui/widgets/category_item.dart';
import 'package:storma/ui/widgets/new_arrivals_item.dart';
import 'package:storma/ui/widgets/popular_product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';
  List<ProductModel> products = [];

  TextEditingController controller = TextEditingController();

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
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              icon: Icon(
                Icons.search_outlined,
                color: cPrimaryColor,
                size: 32,
              ),
            ),
            // Container(
            //   height: 54,
            //   width: 54,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     image: DecorationImage(
            //       image: NetworkImage(
            //         user.profilePhotoUrl,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      );
    }

    Widget searchProduct() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
          style: ElevatedButton.styleFrom(
            primary: cBgColor4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.search_outlined,
                    color: cWhiteColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Search Product',
                    style: whiteTextStyle,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: cWhiteColor,
              ),
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
          // searchProduct(),
          // Expanded(child: const SearchPage()),
          category(),
          popularProducts(),
          newArrivalsProduct(),
        ],
      ),
    );
  }
}
