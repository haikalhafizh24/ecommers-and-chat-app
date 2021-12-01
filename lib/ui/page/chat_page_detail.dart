import 'package:flutter/material.dart';
import 'package:storma/shared/theme.dart';
import 'package:storma/ui/widgets/bubble_chat.dart';

class ChatPageDetail extends StatelessWidget {
  const ChatPageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        // automaticallyImplyLeading: false,
        backgroundColor: cBgColor3,
        // centerTitle: false,
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
                image: const DecorationImage(
                  image: AssetImage('assets/shoes_image.png'),
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
                    'Ultraboost 2.0 zzzzzzzzzzzzzzzzzzzzzzzzz',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$ 78.09',
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
              onPressed: () {},
              icon: const Icon(Icons.cancel),
              color: cPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            previewProduct(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        color: cBgColor2),
                    child: TextFormField(
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
                    onPressed: () {},
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
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: const [
          BubbleChat(
            text: 'halo gaes, ini ready ga yaa?',
            isUser: true,
            hasProduct: true,
          ),
          BubbleChat(
            text: 'halo gaes, ini ready ga yaa?',
            isUser: true,
            hasProduct: false,
          ),
          BubbleChat(
            text: 'Ready ya gaess,langsung pesen aja ya',
            isUser: false,
            hasProduct: false,
          )
        ],
      );
    }

    return Scaffold(
        appBar: PreferredSize(
          child: header(),
          preferredSize: const Size.fromHeight(70),
        ),
        backgroundColor: cBgColor1,
        bottomNavigationBar: chatInput(),
        body: content());
  }
}
