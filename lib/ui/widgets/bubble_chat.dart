import 'package:flutter/material.dart';
import 'package:storma/models/product_model.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/page/product_page.dart';

class BubbleChat extends StatelessWidget {
  final bool isUser;
  final String text;
  final ProductModel product;

  const BubbleChat({
    Key? key,
    required this.text,
    required this.isUser,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 12),
            width: 225,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(isUser ? 0 : 12),
                topLeft: Radius.circular(isUser ? 12 : 0),
                bottomLeft: const Radius.circular(12),
                bottomRight: const Radius.circular(12),
              ),
              color: isUser ? cBgColor5 : cBgColor4,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(product.galleries[0].url),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                          Text(
                            '\$ ${product.price}',
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
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: cPrimaryColor),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(product: product),
                        ),
                      );
                    },
                    child: Text(
                      'Details',
                      style: whiteTextStyle.copyWith(fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          product is UninitializeProductModel
              ? const SizedBox()
              : productPreview(),
          Row(
            mainAxisAlignment:
                isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(isUser ? 0 : 12),
                      topLeft: Radius.circular(isUser ? 12 : 0),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                    color: isUser ? cBgColor5 : cBgColor4,
                  ),
                  child: Text(
                    text,
                    style: whiteTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
