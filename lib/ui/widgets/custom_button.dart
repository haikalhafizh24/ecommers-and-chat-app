import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String tittle;
  final Function() onTap;
  final double width;

  const CustomButton({
    Key? key,
    required this.tittle,
    required this.onTap, 
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: cPrimaryColor),
          child: Center(
            child: Text(
              tittle,
              style: whiteTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
      ),
    );
  }
}
