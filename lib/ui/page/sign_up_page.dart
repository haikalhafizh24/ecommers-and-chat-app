import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/providers/auth_provider.dart';
import 'package:storma/services/secure_storage_service.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/custom_button.dart';
import 'package:storma/ui/widgets/custom_text_form_field.dart';
import 'package:storma/ui/widgets/loading_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/main-page', (route) => false);

        UserSecureStorageService().setUserToken(authProvider.user.token);
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
              'Register Failed',
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
        return CustomTextFormField(
          controller: nameController,
          tittle: 'Full Name',
          hintText: 'Your full name',
          imageUrl: 'assets/User_Icon.png',
        );
      }

      Widget usernameInput() {
        return CustomTextFormField(
          controller: usernameController,
          tittle: 'Username',
          hintText: 'Your Usernamae',
          imageUrl: 'assets/Union.png',
        );
      }

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
            fullNameInput(),
            usernameInput(),
            emailInput(),
            passwordInput(),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return CustomButton(
        tittle: 'Sign Up',
        onTap: handleSignUp,
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

    // @override
    // Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: cBgColor1,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            isLoading ? const LoadingButton() : signUpButton(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
