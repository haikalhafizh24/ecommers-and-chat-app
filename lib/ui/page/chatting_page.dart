import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/chat_tile.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget appbar() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cBgColor3,
        centerTitle: true,
        title: Text(
          'Support Message',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          color: cBgColor1,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/message_image.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'There is No Message',
                style: whiteTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.only(top: defaultMargin),
          color: cBgColor1,
          width: double.infinity,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: const [
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        appbar(),
        content(),
      ],
    );
  }
}
