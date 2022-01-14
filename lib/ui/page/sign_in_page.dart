import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/providers/auth_provider.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/custom_button.dart';
import 'package:storma/ui/widgets/custom_text_form_field.dart';
import 'package:storma/ui/widgets/loading_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      // final token = await UserSecureStorageService.getUserToken() ?? '';

      // await authProvider.getUser(token: token);
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/main-page', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.only(
              right: 20,
              left: 20,
              bottom: 20,
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: cRedColor,
            content: const Text(
              'Login Failed',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

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
        return CustomTextFormField(
          controller: emailController,
          tittle: 'Email Address',
          hintText: 'Your Email Address',
          imageUrl: 'assets/Email_Icon.png',
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          controller: passwordController,
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
        onTap: handleSignIn,
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

    return Scaffold(
      backgroundColor: cBgColor1,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            isLoading ? const LoadingButton() : signInButton(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
