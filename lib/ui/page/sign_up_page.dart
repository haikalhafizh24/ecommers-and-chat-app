import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/custom_button.dart';
import 'package:storma/ui/widgets/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget title() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign Up ',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Create your account',
            style: greyTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget inputSection() {

    Widget fullNameInput() {
      return const CustomTextFormField(
        tittle: 'Full Name',
        hintText: 'Your full name',
        imageUrl: 'assets/User_Icon.png',
      );
    }

    Widget usernameInput() {
      return const CustomTextFormField(
        tittle: 'Username',
        hintText: 'Your Usernamae',
        imageUrl: 'assets/Union.png',
      );
    }

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
          fullNameInput(),
          usernameInput(),
          emailInput(),
          passwordInput(),
        ],
      ),
    );
  }

  Widget signInButton() {
    return CustomButton(
      tittle: 'Sign Up',
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, '/main-page', (route) => false);
      },
    );
  }

  Widget tacButton() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Have an account?',
            style: greyTextStyle,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signIn-page');
            },
            child: Text(
              'Sign In',
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
