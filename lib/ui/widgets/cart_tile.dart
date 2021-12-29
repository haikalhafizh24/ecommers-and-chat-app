import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/cart_model.dart';
import 'package:storma/providers/cart_provider.dart';
import 'package:storma/shared/theme.dart';

class CartTile extends StatelessWidget {
  final CartModel cart;
  const CartTile({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

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
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      cart.product.galleries[0].url,
                    ),
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
                      cart.product.name,
                      style: whiteTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$ ${cart.product.price}',
                      style: blueTextStyle.copyWith(
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: cRedColor,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        cartProvider.removeCart(cart.id);
                      },
                    ),
                    Text(
                      'Remove',
                      style: redTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: cPrimaryColor,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        cartProvider.reduceQuantity(cart.id);
                      },
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      cart.quantity.toString(),
                      style: whiteTextStyle,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: cPrimaryColor,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        cartProvider.addQuantity(cart.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
