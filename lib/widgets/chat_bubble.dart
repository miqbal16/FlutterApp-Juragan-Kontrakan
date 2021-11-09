import 'package:flutter/material.dart';
import 'package:juragan_kontrak/themes/style.dart';

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String message;
  const ChatBubble({required this.isSender, required this.message, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      width: double.infinity,
      child: Row(
        textDirection: (isSender) ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: (isSender)
                  ? const BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    )
                  : const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
              child: Text(
                message,
                style: titleTextStyle3.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
