import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';

class CategoryItem extends StatelessWidget {
  final String tittle;
  final bool index;

  const CategoryItem({
    Key? key,
    required this.tittle,
    this.index = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15,),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: index == true ? cPrimaryColor : cTransparentColor,
        border: Border.all(color: index == true ? cPrimaryColor : cDeactiveColor),
      ),
      child: Center(
        child: Text(
          tittle,
          style: index == true ? whiteTextStyle : deactiveTextStyle.copyWith(
            fontSize: 13,
            fontWeight: index == true ? medium : light,
          ),
        ),
      ),
    );
  }
}
