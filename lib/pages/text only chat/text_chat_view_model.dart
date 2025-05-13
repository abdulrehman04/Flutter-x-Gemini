import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gemini/core/enums/user_type.dart';
import 'package:gemini/models/chat_message.dart';
import 'package:gemini/services/gemini_service.dart';
import 'package:speech_to_text/speech_to_text.dart';

class TextChatViewModel extends ChangeNotifier {
  List<ChatMessage> messages = [];
  bool isLoading = false;
  TextEditingController messageController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

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

  void convertSpeechToText(TextEditingController controller) async {
    final speechToText = SpeechToText();
    bool available = await speechToText.initialize(
      onStatus: (status) => debugPrint('Speech status: $status'),
      onError: (error) => debugPrint('Speech error: $error'),
      debugLogging: true,
    );

    if (available) {
      speechToText.listen(
        onResult: (result) {
          controller.text = result.recognizedWords;
        },
      );
    } else {
      debugPrint('Speech recognition not available');
    }
  }
}
