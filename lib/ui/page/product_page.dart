import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/product_model.dart';
import 'package:storma/providers/cart_provider.dart';
import 'package:storma/providers/wishlist_provider.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/page/chat_page_detail.dart';
import 'package:storma/ui/widgets/custom_button.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartPRovider = Provider.of<CartProvider>(context);

    Widget cartTotal() {
      return Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: cRedColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            cartPRovider.totalItems().toString(),
            style: bgColor4TextStyle.copyWith(
              fontSize: 10,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

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
                  size: 30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/cart-page');
                },
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      'assets/Cart_icon.png',
                      width: 25,
                      color: cBgColor1,
                    ),
                    cartPRovider.totalItems() == 0
                        ? const SizedBox()
                        : cartTotal(),
                  ],
                ),
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
      // NOTE: Product Image
      return Column(
        children: [
          CarouselSlider(
            items: widget.product.galleries
                .map(
                  (image) => Image.network(
                    image.url,
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
            children: widget.product.galleries.map((e) {
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
                            widget.product.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            widget.product.category.name,
                            style: greyTextStyle,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          wishlistProvider.setProduct(widget.product);

                          if (wishlistProvider.isWishlist(widget.product)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                margin: const EdgeInsets.only(
                                  right: 20,
                                  left: 20,
                                  bottom: 10,
                                ),
                                duration: const Duration(milliseconds: 700),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: cBlueColor,
                                content: const Text(
                                  'Has been added to wishlist',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                margin: const EdgeInsets.only(
                                  right: 20,
                                  left: 20,
                                  bottom: 10,
                                ),
                                duration: const Duration(milliseconds: 700),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: cRedColor,
                                content: const Text(
                                  'Has been removed from wishlist',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        },
                        child: Icon(
                          Icons.favorite,
                          color: wishlistProvider.isWishlist(widget.product)
                              ? cRedColor
                              : cDeactiveColor,
                          size: 22,
                        ),
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
                        '\$ ${widget.product.price}',
                        style: blueTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),

                // Description
                Container(
                  width: double.infinity,
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
                        widget.product.description,
                        style: greyTextStyle,
                        textAlign: TextAlign.justify,
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
        padding: const EdgeInsets.all(15),
        color: cBgColor1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChatPageDetail(product: widget.product),
                  ),
                );
              },
              child: Container(
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
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomButton(
                tittle: 'Add to Cart',
                onTap: () {
                  cartPRovider.addCart(widget.product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      margin: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        bottom: 10,
                      ),
                      duration: const Duration(milliseconds: 700),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: cBlueColor,
                      content: const Text(
                        'Product has been added to cart ',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
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
