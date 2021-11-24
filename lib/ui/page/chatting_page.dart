import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      backgroundColor: cBgColor1,
      body: Center(
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
}