import 'package:flutter/material.dart';
import 'package:storma/ui/page/cart_page.dart';
import 'package:storma/ui/page/chatting_page.dart';
import 'package:storma/ui/page/home_page.dart';
import 'package:storma/ui/page/love_page.dart';
import 'package:storma/ui/page/main_page.dart';
import 'package:storma/ui/page/profile_page.dart';
import 'package:storma/ui/page/sign_in_page.dart';
import 'package:storma/ui/page/sign_up_page.dart';
import 'package:storma/ui/page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/signIn-page' : (context) => const SignInPage(),
        '/signUp-page' : (context) => const SignUpPage(),
        '/main-page' : (context) => const MainPage(),
        '/home-page' : (context) => const HomePage(),
        '/chat-page' : (context) => const ChattingPage(),
        '/love-page' : (context) => const LovePage(),
        '/profile-page' : (context) => const ProfilePage(),
        '/cart-page' : (context) => const CartPage(),
      },
    );
  }
}