import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/custom_button.dart';

class CheckoutSuccesPage extends StatelessWidget {
  const CheckoutSuccesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/emptyCart_icon.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Transaction Success!!',
              style: whiteTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              tittle: 'Order Another Shoes',
              width: 153,
              onTap: () {
                Navigator.pushNamed(context, '/main-page');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              tittle: 'My Transaction',
              width: 153,
              color: cDeactiveColor,
              onTap: () {
                Navigator.pushNamed(context, '/main-page');
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: cBgColor3,
      body: content(),
    );
  }
}
