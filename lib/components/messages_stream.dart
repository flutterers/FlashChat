import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_bubble.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream({
    super.key,
    required this.currentUserMail,
  });

  final String? currentUserMail;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        List<Widget> messageWidgets = [];
        if (snapshot.hasData == false) {
          return const Center(child: CircularProgressIndicator());
        }

        var messages = snapshot.data?.docs.reversed;
        for (var message in messages!) {
          final messageText = message['text'];
          final messageSender = message['sender'];

          messageWidgets.add(MessageBubble(
            message: messageText,
            sender: messageSender,
            isMe: currentUserMail == messageSender,
          ));
        }
        return ListView(
          scrollDirection: Axis.vertical,
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          children: messageWidgets,
        );
      },
    );
  }
}
