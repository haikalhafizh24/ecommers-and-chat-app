import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class LoadingButton extends StatelessWidget {
  final double width;
  final Color color;

  const LoadingButton({
    Key? key,
    this.width = double.infinity,
    this.color = const Color(0xFF6C5ECF),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 18,
            width: 18,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(cWhiteColor),
              strokeWidth: 2,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Loading ',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
