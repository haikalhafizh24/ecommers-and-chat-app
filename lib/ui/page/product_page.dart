import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/custom_button.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List imageProduct = [
    'assets/shoes_image.png',
    'assets/shoes_image.png',
    'assets/shoes_image.png',
    'assets/shoes_image.png',
  ];

  List similiarShoes = [
    'assets/shoes_image1.png',
    'assets/shoes_image2.png',
    'assets/shoes_image3.png',
    'assets/shoes_image4.png',
    'assets/shoes_image1.png',
    'assets/shoes_image2.png',
    'assets/shoes_image3.png',
    'assets/shoes_image4.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                // iconSize: 32,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: cBgColor1,
                ),
              ),
              Image.asset(
                'assets/Cart_icon.png',
                width: 22,
                color: cBgColor1,
              ),
            ],
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        height: 4,
        width: currentIndex == index ? 16 : 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              currentIndex == index ? cPrimaryColor : const Color(0xFFc4c4c4),
        ),
      );
    }

    Widget similiarShoesItem(String imageUrl) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cBgColor4,
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
            // Container(
            //   // margin: const EdgeInsets.only(
            //   //   top: 100,
            //   // ),
            //   // height: 30,
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //       colors: [
            //         cWhiteColor.withOpacity(0),
            //         cBgColor3.withOpacity(1)
            //       ],
            //     ),
            //   ),
            // ),

            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Adidas Ultraboost 2.0',
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                ),
                overflow: TextOverflow.clip,
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      int index = -1;

      return Column(
        children: [
          CarouselSlider(
            items: imageProduct
                .map(
                  (imageProduct) => Image.asset(
                    imageProduct,
                    width: MediaQuery.of(context).size.width,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageProduct.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),

          // NOTE: DETAIL
          Container(
            margin: const EdgeInsets.only(top: 25),
            padding: EdgeInsets.symmetric(vertical: defaultMargin),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: cBgColor1,
            ),
            child: Column(
              children: [
                // Tittle Product
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adidas Ultraboost 2.0',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'Sneakers',
                            style: greyTextStyle,
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/Love_icon.png',
                        color: cRedColor,
                        width: 22,
                      ),
                    ],
                  ),
                ),

                // NOTE : PRICE
                Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  padding: const EdgeInsets.all(15),
                  color: cBgColor2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: whiteTextStyle,
                      ),
                      Text(
                        '\$ 78.98',
                        style: blueTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),

                // Description
                Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: whiteTextStyle,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
                        style: greyTextStyle,
                      ),
                    ],
                  ),
                ),

                // FAMILIAR SHOES
                Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        child: Text(
                          'Familiar Shoes',
                          style: whiteTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 165,
                        child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 4 / 2.5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          scrollDirection: Axis.horizontal,
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          children: similiarShoes
                              .map(
                                (imageProduct) => Container(
                                  child: similiarShoesItem(imageProduct),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    Widget actionButton() {
      return Container(
        padding: const EdgeInsets.all(
          // left: 10,
          // right: 10,
          // bottom: 10,
          // top:
          5,
        ),
        color: cBgColor1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: cPrimaryColor),
              ),
              child: Center(
                child: Image.asset(
                  'assets/chat_icon.png',
                  color: cPrimaryColor,
                  width: 23,
                  height: 22,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomButton(
                tittle: 'Add to Chart',
                onTap: () {},
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomButton(
                color: cBlueColor,
                tittle: 'Order Now',
                onTap: () {},
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: cBgColor6,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
      bottomNavigationBar: actionButton(),
    );
  }
}
