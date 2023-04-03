import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key,
      required this.message,
      required this.sender,
      required this.isMe})
      : super(key: key);

  final String message;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              sender,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
          Material(
            // color: Colors.pink.shade800,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            elevation: 10,
            borderRadius: BorderRadius.only(
              topLeft:
                  isMe ? const Radius.circular(30) : const Radius.circular(0),
              bottomLeft: const Radius.circular(30),
              bottomRight: const Radius.circular(30),
              topRight:
                  isMe ? const Radius.circular(0) : const Radius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 18,
                    color: isMe ? Colors.white : Colors.black54,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
