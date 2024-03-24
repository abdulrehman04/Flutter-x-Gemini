import 'package:flutter/material.dart';
import 'package:gemini/core/enums/user_type.dart';
import 'package:gemini/models/chat_message.dart';
import 'package:gemini/services/gemini_service.dart';

class TextChatViewModel extends ChangeNotifier {
  List<ChatMessage> messages = [];
  bool isLoading = false;
  TextEditingController messageController = TextEditingController();

  updateLoader(bool input) {
    isLoading = input;
    notifyListeners();
  }

  Future<void> sendInput(String input) async {
    messages.insert(0, ChatMessage(message: input, userType: UserType.human));
    updateLoader(true);
    String response = await GeminiService.instance.generateTextContent(input);
    messages.insert(
      0,
      ChatMessage(message: response, userType: UserType.gemini),
    );
    updateLoader(false);
  }
}
