import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/checkout_item.dart';
import 'package:storma/ui/widgets/custom_button.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: cBgColor1,
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            // NOTE: Shipping Addres Details
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: cBgColor4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping Address',
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF2F3344),
                          ),
                          child: const Icon(
                            Icons.location_city_rounded,
                            color: Color(0xFF38ABBE),
                            size: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            'No. 229, RW. 84, Jatinegara, Kec. Cakung, Kota Jakarta Timur, DKI Jakarta',
                            style: whiteTextStyle,
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            // NOTE: Items
            Column(
              children: const [
                CheckoutItem(
                  imageUrl: 'assets/shoes_image.png',
                  tittle: 'Adidas Ultraboost 2.0',
                  price: '\$ 76. 98',
                  totalItem: 2,
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: cBgColor4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Summary',
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Quantity',
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        '2 Items',
                        style: whiteTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Price',
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        '\$ 157.78',
                        style: whiteTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        'Free',
                        style: whiteTextStyle,
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    color: cDeactiveColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: blueTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        '\$ 157.78',
                        style: blueTextStyle.copyWith(
                          fontWeight: semiBold,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget actionButton() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        // color: cBgColor1,
        child: Expanded(
          child: CustomButton(
            color: cPrimaryColor,
            tittle: 'Order Now',
            onTap: () {
              Navigator.pushNamed(context, '/checkout');
            },
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: cBgColor3,
      appBar: PreferredSize(
        child: header(),
        preferredSize: const Size.fromHeight(60),
      ),
      body: content(),
      bottomNavigationBar: actionButton(),
    );
  }
}
