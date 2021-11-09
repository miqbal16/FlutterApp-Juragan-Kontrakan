import 'package:flutter/material.dart';
import 'package:juragan_kontrak/models/house.dart';
import 'package:juragan_kontrak/models/list_chat.dart';
import 'package:juragan_kontrak/themes/style.dart';
import 'package:juragan_kontrak/widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  final House ownerHouse;

  const ChatPage({required this.ownerHouse, Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final TextEditingController _chatInput = TextEditingController(
      text: (listChat[widget.ownerHouse.id] == null)
          ? 'Permisi, Apakah rumahnya masih bisa dikontrakin pak? Terimakasih'
          : null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: costumeFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.deepOrange,
          ),
          toolbarHeight: double.infinity,
          backgroundColor: Colors.grey[200],
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Back',
              ),
              const CircleAvatar(
                radius: 28,
                child: Icon(
                  Icons.person,
                  size: 32,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.ownerHouse.nameHouse,
                    style: titleTextStyle3.copyWith(
                        fontWeight: medium, fontSize: 14),
                  ),
                  Text(
                    'Online',
                    style: subTitleTextStyle3.copyWith(
                      fontWeight: ligth,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final dataChat = listChat[widget.ownerHouse.id];
          return (dataChat != null)
              ? ChatBubble(
                  isSender: true,
                  message: dataChat['message'][index],
                )
              : const SizedBox();
        },
        itemCount: (listChat[widget.ownerHouse.id] == null)
            ? 0
            : listChat[widget.ownerHouse.id]['message'].length,
      ),
    );
  }

  Widget costumeFloatingActionButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 45,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Type Message...',
                  hintStyle: subTitleTextStyle3,
                ),
                keyboardType: TextInputType.text,
                controller: _chatInput,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_chatInput.text != '') {
                    if (listChat[widget.ownerHouse.id] != null) {
                      listChat[widget.ownerHouse.id]['message']
                          .add(_chatInput.text);
                    } else {
                      listChat[widget.ownerHouse.id] = {
                        'house': widget.ownerHouse,
                        'message': [_chatInput.text],
                      };
                    }
                    _chatInput.text = '';
                  }
                });
              },
              child: const Icon(
                Icons.send,
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(double.infinity),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _chatInput.dispose();
    super.dispose();
  }
}
