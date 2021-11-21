
import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/custom_button.dart';
import 'package:storma/ui/widgets/custom_text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Widget title() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign In',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Login to your existing account',
            style: greyTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget inputSection() {
    Widget emailInput() {
      return const CustomTextFormField(
        tittle: 'Email Address',
        hintText: 'Your Email Address',
        imageUrl: 'assets/Email_Icon.png',
      );
    }

    Widget passwordInput() {
      return const CustomTextFormField(
        tittle: 'Password',
        hintText: 'Your Password',
        imageUrl: 'assets/Password_Icon.png',
        obsecureText: true,
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultMargin),
      child: Column(
        children: [
          emailInput(),
          passwordInput(),
        ],
      ),
    );
  }

  Widget signInButton() {
    return CustomButton(
      tittle: 'Sign In',
      onTap: () {},
    );
  }

  Widget tacButton() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: greyTextStyle,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signUp-page');
            },
            child: Text(
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor1,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            signInButton(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
