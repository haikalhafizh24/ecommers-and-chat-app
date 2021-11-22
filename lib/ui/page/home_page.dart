import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor1,
      body: Center(
        child: Text('Home Page', style: whiteTextStyle)
      ),
    );
  }
}