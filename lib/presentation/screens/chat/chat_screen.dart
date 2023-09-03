import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://pm1.aminoapps.com/6570/91e75f18137043dd0bf7874c9832a826a25a878a_128.jpg'),
          ),
        ),
        title: const Text('Mi señor'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(itemBuilder: ((context, index) {
              return (index % 2 == 0) ? HisMessageBubble() : MyMessageBubble();
            }))),
            Text('Mundo')
          ],
        ),
      ),
    );
  }
}
