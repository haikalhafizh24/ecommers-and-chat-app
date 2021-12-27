import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/user_model.dart';
import 'package:storma/providers/auth_provider.dart';
import 'package:storma/shared/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        user.profilePhotoUrl,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: whiteTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '@${user.username}',
                        style: deactiveTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.exit_to_app_rounded,
                    color: cRedColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: cBgColor3,
      );
    }

    Widget accountSetting() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SettingsTile(
            ontap: () {
              Navigator.pushNamed(context, '/edit-profile-page');
            },
            tittle: 'Edit Profile',
          ),
          SettingsTile(
            ontap: () {},
            tittle: 'Your Transaction',
          ),
          SettingsTile(
            ontap: () {},
            tittle: 'Help',
          ),
        ],
      );
    }

    Widget generalSetting() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SettingsTile(
              ontap: () {},
              tittle: 'Privacy & Policy',
            ),
            SettingsTile(
              ontap: () {},
              tittle: 'Term of Service',
            ),
            SettingsTile(
              ontap: () {},
              tittle: 'Rate App',
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.all(defaultMargin),
        children: [
          accountSetting(),
          generalSetting(),
        ],
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        child: header(),
        preferredSize: const Size.fromHeight(100),
      ),
      backgroundColor: cBgColor1,
      body: content(),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String tittle;
  final Function() ontap;

  const SettingsTile({
    Key? key,
    required this.tittle,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tittle,
              style: greyTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            Transform.rotate(
              angle: 3.1,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: cGreyColor,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
