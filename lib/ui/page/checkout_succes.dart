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
              margin: const EdgeInsets.only(left: 60),
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/transaction_succes.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Transaction Success',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            CustomButton(
              tittle: 'Order Another Shoes',
              width: 200,
              onTap: () {
                Navigator.pushNamed(context, '/main-page');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              tittle: 'My Transaction',
              width: 200,
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
