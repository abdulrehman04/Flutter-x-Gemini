import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gemini/core/enums/user_type.dart';
import 'package:gemini/models/chat_message.dart';
import 'package:gemini/services/gemini_service.dart';
import 'package:gemini/services/image_picker_service.dart';
import 'package:gemini/utils/utils.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class TextAndImageViewModel extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController messageController = TextEditingController();
  ChatMessage? query, aiResponse, image;

  updateLoader(bool input) {
    isLoading = input;
    notifyListeners();
  }

  Future<void> sendImageInput(BuildContext context, String input) async {
    if (image?.imageData == null || input.isEmpty) {
      Utils.instance.showSnackbar(
        context,
        'Kindly add image and a query',
        isError: true,
      );
    } else {
      _sendImageInput(input, image!.imageData!);
    }
  }

  Future<void> _sendImageInput(String input, Uint8List imageData) async {
    query = ChatMessage(userType: UserType.human, message: input);
    updateLoader(true);
    final dataPart = DataPart(
      'image/jpeg',
      image!.imageData!,
    );
    String response = await GeminiService.instance.generateTextAndImageContent(
      input,
      dataPart,
    );
    aiResponse = ChatMessage(userType: UserType.gemini, message: response);
    updateLoader(false);
  }

  pickImage() async {
    resetContent();
    Uint8List pickedImage = await ImagePickerService().pickImageAsBytes();
    image = ChatMessage(
      userType: UserType.human,
      isImage: true,
      imageData: pickedImage,
    );
    notifyListeners();
  }

  resetContent() {
    query = null;
    aiResponse = null;
    image = null;
  }
}
