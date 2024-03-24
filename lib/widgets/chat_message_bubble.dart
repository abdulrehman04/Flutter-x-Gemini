import 'package:flutter/material.dart';
import 'package:gemini/core/constants/app_colors.dart';
import 'package:gemini/core/enums/user_type.dart';
import 'package:gemini/models/chat_message.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({super.key, required this.item});

  final ChatMessage item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: item.userType == UserType.gemini
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.instance.secondaryColor,
              ),
              padding: const EdgeInsets.all(10),
              child: item.isImage
                  ? Image.memory(item.imageData!)
                  : Text(item.message),
            ),
          ),
        ),
      ],
    );
  }
}
