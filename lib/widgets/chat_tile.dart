import 'package:flutter/material.dart';
import 'package:juragan_kontrak/models/house.dart';
import 'package:juragan_kontrak/pages/chat_page.dart';
import 'package:juragan_kontrak/themes/style.dart';

class ChatTile extends StatelessWidget {
  final House? house;
  final List<String> message;

  const ChatTile({this.house, required this.message, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatPage(ownerHouse: house!);
        }));
      },
      child: Card(
        margin: const EdgeInsets.only(top: 3),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    child: (house == null)
                        ? Image.asset('assets/images/logo.png')
                        : const Icon(Icons.person, size: 32),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.55,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (house == null) ? 'Admin' : house!.nameHouse,
                            style: titleTextStyle3.copyWith(
                              fontWeight: medium,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            message.last,
                            overflow: TextOverflow.ellipsis,
                            style: subTitleTextStyle3.copyWith(
                              fontWeight: ligth,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'now',
                style: subTitleTextStyle3.copyWith(
                    fontWeight: ligth, fontSize: 13),
              )
            ],
          ),
        ),
      ),
    );
  }
}
