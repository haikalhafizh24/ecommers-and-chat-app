import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String tittle;
  final Function() onTap;
  final double width;
  final Color color;

  const CustomButton({
    Key? key,
    required this.tittle,
    required this.onTap,
    this.width = double.infinity,
    this.color = const Color(0xFF6C5ECF),
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
          color: color,
        ),
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
