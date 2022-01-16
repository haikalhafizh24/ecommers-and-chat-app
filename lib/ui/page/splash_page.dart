import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/providers/auth_provider.dart';
import 'package:storma/providers/product_provider.dart';
import 'package:storma/services/secure_storage_service.dart';
import 'package:storma/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final UserSecureStorageService userSecureStorageService =
      UserSecureStorageService();

  @override
  void initState() {
    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();

    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    final token = await UserSecureStorageService().getUserToken() ?? '';

    if (await authProvider.getUser(token: token)) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/main-page', (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/signIn-page', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo_icon.png'),
            ),
          ),
        ),
      ),
    );
  }
}
