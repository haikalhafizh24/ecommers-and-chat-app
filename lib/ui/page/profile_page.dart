import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor1,
      body: Center(
        child: Text('Profile Page', style: whiteTextStyle)
      ),
    );
  }
}