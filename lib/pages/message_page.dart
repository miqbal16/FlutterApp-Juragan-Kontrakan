import 'package:flutter/material.dart';
import 'package:juragan_kontrak/models/list_chat.dart';
import 'package:juragan_kontrak/themes/style.dart';
import 'package:juragan_kontrak/widgets/chat_tile.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (listChat.isNotEmpty)
        ? ListView.builder(
            itemBuilder: (context, index) {
              final dataChat = listChat.values.toList();
              return ChatTile(
                message: dataChat[index]['message'],
                house: dataChat[index]['house'],
              );
            },
            itemCount: listChat.length,
          )
        : emptyListChat();
  }

  Widget emptyListChat() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/headset.png',
            color: Colors.deepOrange[200],
            width: 180,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Kamu tidak memiliki list pesan',
            style: titleTextStyle3.copyWith(fontWeight: medium),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Silahkan explorer rumah yang diiginkan',
            style: subTitleTextStyle2.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
