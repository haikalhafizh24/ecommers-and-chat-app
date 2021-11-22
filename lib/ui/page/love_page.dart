import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class LovePage extends StatelessWidget {
  const LovePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor1,
      body: Center(
        child: Text('Love Page', style: whiteTextStyle)
      ),
    );
  }
}