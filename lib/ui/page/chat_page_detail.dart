import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storma/models/message_model.dart';
import 'package:storma/models/product_model.dart';
import 'package:storma/providers/auth_provider.dart';
import 'package:storma/services/message_service.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/bubble_chat.dart';

// ignore: must_be_immutable
class ChatPageDetail extends StatefulWidget {
  ProductModel product;
  ChatPageDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ChatPageDetail> createState() => _ChatPageDetailState();
}

class _ChatPageDetailState extends State<ChatPageDetail> {
  TextEditingController messageController = TextEditingController(text: '');
  ScrollController controller = ScrollController();

  void autoScrolldown() {
    controller.jumpTo(controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      if (messageController.text != '') {
        await MessageService().addMessage(
          user: authProvider.user,
          isFromUser: true,
          message: messageController.text,
          product: widget.product,
        );
        setState(() {
          widget.product = UninitializeProductModel();
          messageController.text = "";
        });
      }
      autoScrolldown();
    }

    Widget header() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: cBgColor3,
        title: Row(
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/store_imageLogo.png'),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Support Message',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  'Online',
                  style: deactiveTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget previewProduct() {
      return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        height: 75,
        width: 225,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: cBgColor5,
            border: Border.all(color: cPrimaryColor)),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(widget.product.galleries[0].url),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product.name,
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$ ${widget.product.price}',
                    style: blueTextStyle.copyWith(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
            IconButton(
              iconSize: 22,
              onPressed: () {
                setState(() {
                  widget.product = UninitializeProductModel();
                });
              },
              icon: const Icon(Icons.cancel),
              color: cPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.product is UninitializeProductModel
                ? const SizedBox()
                : previewProduct(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        color: cBgColor2),
                    child: TextFormField(
                      controller: messageController,
                      style: whiteTextStyle,
                      cursorColor: cBlueColor,
                      decoration: InputDecoration(
                        hintText: 'Your Message',
                        hintStyle: greyTextStyle,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: cPrimaryColor),
                  child: IconButton(
                    onPressed: handleAddMessage,
                    icon: const Icon(Icons.send_sharp),
                    color: cWhiteColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        child: StreamBuilder<List<MessageModel>>(
            stream: MessageService()
                .getMessageByUserId(userId: authProvider.user.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  controller: controller,
                  padding: EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  children: snapshot.data!
                      .map(
                        (MessageModel message) => BubbleChat(
                            text: message.message,
                            isUser: message.isFromUser,
                            product: message.product),
                      )
                      .toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      );
    }

    return Scaffold(
      body: Scaffold(
        appBar: PreferredSize(
          child: header(),
          preferredSize: const Size.fromHeight(70),
        ),
        backgroundColor: cBgColor1,
        bottomNavigationBar: chatInput(),
        body: content(),
      ),
    );
  }
}
