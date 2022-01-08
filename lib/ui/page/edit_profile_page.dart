import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/user_model.dart';
import 'package:storma/providers/auth_provider.dart';
import 'package:storma/shared/theme.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleUpdateProfile() async {
      if (await authProvider.updateProfile(
          name: nameController.text,
          username: usernameController.text,
          email: emailController.text,
          token: authProvider.user.token)) {
        Navigator.pop(context);
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
              'Update Profile Failed',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

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
            onPressed: handleUpdateProfile,
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
                  controller: nameController,
                  tittle: 'Name',
                  hintText: user.name,
                ),
                InputForm(
                  controller: usernameController,
                  tittle: 'Username',
                  hintText: user.username,
                ),
                InputForm(
                  controller: emailController,
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
  final TextEditingController controller;
  const InputForm({
    Key? key,
    required this.tittle,
    required this.hintText,
    required this.controller,
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
            controller: controller,
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
