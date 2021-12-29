import 'package:flutter/material.dart';
import 'package:storma/models/cart_model.dart';
import 'package:storma/shared/theme.dart';

class CheckoutItem extends StatelessWidget {
  final CartModel cart;
  const CheckoutItem({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: cBgColor4,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(cart.product.galleries[0].url),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cart.product.name,
                      style: whiteTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      '\$ ${cart.product.price}',
                      style: blueTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${cart.quantity} items',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
