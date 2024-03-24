import 'dart:typed_data';

import 'package:gemini/core/enums/user_type.dart';

class ChatMessage {
  String message;
  UserType userType;
  bool isImage;
  Uint8List? imageData;

  ChatMessage({
    this.message = '',
    required this.userType,
    this.isImage = false,
    this.imageData,
  });
}
