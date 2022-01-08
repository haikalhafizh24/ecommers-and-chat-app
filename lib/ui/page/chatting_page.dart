import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/message_model.dart';
import 'package:storma/providers/auth_provider.dart';
import 'package:storma/services/message_service.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/chat_tile.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget appbar() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cBgColor3,
        centerTitle: true,
        title: Text(
          'Support Message',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          color: cBgColor1,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/empty_chat.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'There is No Message',
                style: whiteTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream:
              MessageService().getMessageByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return emptyChat();
              }
              return Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: defaultMargin),
                  color: cBgColor1,
                  width: double.infinity,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    children: [
                      ChatTile(
                        message: snapshot.data![snapshot.data!.length - 1],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }

    return Column(
      children: [
        appbar(),
        content(),
        // emptyChat(),
      ],
    );
  }
}
