import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String tittle;
  final String hintText;
  final String imageUrl;
  final bool obsecureText;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.tittle,
    required this.hintText,
    required this.imageUrl,
    this.obsecureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tittle,
            style: whiteTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                color: cBgColor2),
            child: Row(
              children: [
                Image.asset(
                  imageUrl,
                  width: 16,
                  height: 18,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    obscureText: obsecureText,
                    style: whiteTextStyle,
                    cursorColor: cBlueColor,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: greyTextStyle,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
