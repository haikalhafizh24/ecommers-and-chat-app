import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor1,
      body: Center(
        child: Text('Chatting Page', style: whiteTextStyle)
      ),
    );
  }
}