import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hola Caracola', fromWho: FromWho.me),
    Message(text: 'Te hare algunas preguntas para comenzar', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')) {
      hisReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> hisReply() async {
    final hisMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(hisMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
