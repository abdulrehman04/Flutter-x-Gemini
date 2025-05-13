import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini/core/constants/app_colors.dart';
import 'package:gemini/core/state_service.dart';
import 'package:gemini/models/chat_message.dart';
import 'package:gemini/pages/text%20only%20chat/text_chat_view_model.dart';
import 'package:gemini/widgets/bottom_message_bar.dart';
import 'package:gemini/widgets/chat_message_bubble.dart';
import 'package:gemini/widgets/response_loading_shimmer.dart';

class TextChatView extends ConsumerWidget {
  const TextChatView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    TextChatViewModel controller = ref.watch(
      StateService.instance.textChatViewModel,
    );
    return Scaffold(
      backgroundColor: AppColors.instance.whiteColor,
      appBar: AppBar(
        title: const Text('Text Input'),
      ),
      bottomSheet: BottomMessageBar(
        controller: controller.messageController,
        onSend: () {
          controller.sendInput(
            controller.messageController.text.trim(),
          );
          controller.messageController.text = '';
        },
        onMicTap: () {
          controller.convertSpeechToText(controller.messageController);
        },
      ),
      body: ListView.builder(
        itemCount: controller.messages.length + (controller.isLoading ? 1 : 0),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 70),
        reverse: true,
        itemBuilder: (context, index) {
          if (index == 0 && controller.isLoading) {
            return const ResponseLoadingShimmer();
          } else {
            ChatMessage item =
                controller.messages[index - (controller.isLoading ? 1 : 0)];
            return ChatMessageBubble(
              item: item,
              onSpeak: () {
                controller.speak(item.message);
              },
            );
          }
        },
      ),
    );
  }
}
