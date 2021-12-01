import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class BubbleChat extends StatelessWidget {
  final bool isUser;
  final bool hasProduct;
  final String text;

  const BubbleChat({
    Key? key,
    required this.text,
    required this.isUser,
    required this.hasProduct
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
                        image: const DecorationImage(
                          image: AssetImage('assets/shoes_image.png'),
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
                            'Adidas Ultraboost 2.0',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                          Text(
                            '\$ 78.09',
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
                    onPressed: () {},
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
          hasProduct ? productPreview() : const SizedBox(),
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
