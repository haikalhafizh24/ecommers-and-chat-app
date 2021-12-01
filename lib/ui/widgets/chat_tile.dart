import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/chat-page-detail');
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 54,
                width: 54,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/store_imageLogo.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Storma Seller",
                      style: whiteTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Your item is ready, Your item is ready",
                      overflow: TextOverflow.ellipsis,
                      style: greyTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                'Now',
                style: greyTextStyle.copyWith(
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 0.4,
            margin: const EdgeInsets.symmetric(vertical: 15),
            color: cDeactiveColor,
          )
        ],
      ),
    );
  }
}
