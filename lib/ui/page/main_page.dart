import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/providers/page_provider.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/page/chatting_page.dart';
import 'package:storma/ui/page/home_page.dart';
import 'package:storma/ui/page/love_page.dart';
import 'package:storma/ui/page/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget cartButton() {
      return FloatingActionButton(
        backgroundColor: cBlueColor,
        onPressed: () {
          Navigator.pushNamed(context, '/cart-page');
        },
        child: Image.asset(
          'assets/Cart_icon.png',
          width: 20,
          height: 22,
        ),
      );
    }

    Widget customBottomNavbar() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(18),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: BottomNavigationBar(
            enableFeedback: false,
            onTap: (value) {
              pageProvider.currentIndex = value;
            },
            currentIndex: pageProvider.currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: cBgColor4,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  margin: const EdgeInsets.only(top: 18, bottom: 5),
                  child: Image.asset(
                    'assets/Home_icon.png',
                    color: pageProvider.currentIndex == 0
                        ? cPrimaryColor
                        : cGreyColor,
                    width: 22,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  margin: const EdgeInsets.only(top: 18, bottom: 5, right: 40),
                  child: Image.asset(
                    'assets/chat_icon.png',
                    color: pageProvider.currentIndex == 1
                        ? cPrimaryColor
                        : cGreyColor,
                    width: 22,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  margin: const EdgeInsets.only(top: 18, bottom: 5, left: 40),
                  child: Image.asset(
                    'assets/Love_icon.png',
                    color: pageProvider.currentIndex == 2
                        ? cPrimaryColor
                        : cGreyColor,
                    width: 22,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  margin: const EdgeInsets.only(top: 18, bottom: 5),
                  child: Image.asset(
                    'assets/Profile_icon.png',
                    color: pageProvider.currentIndex == 3
                        ? cPrimaryColor
                        : cGreyColor,
                    width: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget body(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChattingPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: cBgColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNavbar(),
      body: body(pageProvider.currentIndex),
    );
  }
}
