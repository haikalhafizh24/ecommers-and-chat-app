import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/user_model.dart';
import 'package:storma/providers/auth_provider.dart';
import 'package:storma/shared/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        backgroundColor: cBgColor1,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.check,
              color: cBlueColor,
            ),
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    user.profilePhotoUrl,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Change Image',
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                InputForm(
                  tittle: 'Name',
                  hintText: user.name,
                ),
                InputForm(
                  tittle: 'Username',
                  hintText: user.username,
                ),
                InputForm(
                  tittle: 'Email Address',
                  hintText: user.email,
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: cBgColor3,
      appBar: PreferredSize(
        child: header(),
        preferredSize: const Size.fromHeight(60),
      ),
      body: content(),
    );
  }
}

class InputForm extends StatelessWidget {
  final String tittle;
  final String hintText;
  const InputForm({
    Key? key,
    required this.tittle,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tittle,
            style: greyTextStyle,
          ),
          TextFormField(
            style: whiteTextStyle,
            cursorColor: cBlueColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: whiteTextStyle,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: cGreyColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
