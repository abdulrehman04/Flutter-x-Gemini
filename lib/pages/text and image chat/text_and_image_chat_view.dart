import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini/core/constants/app_colors.dart';
import 'package:gemini/core/state_service.dart';
import 'package:gemini/pages/text%20and%20image%20chat/text_and_image_chat_view_model.dart';
import 'package:gemini/widgets/bottom_message_bar.dart';
import 'package:gemini/widgets/chat_message_bubble.dart';
import 'package:gemini/widgets/response_loading_shimmer.dart';

class TextAndImageView extends ConsumerWidget {
  const TextAndImageView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    TextAndImageViewModel controller = ref.watch(
      StateService.instance.textAndImageChatViewModel,
    );
    return Scaffold(
      backgroundColor: AppColors.instance.whiteColor,
      appBar: AppBar(
        title: const Text('Text and Image Input'),
      ),
      bottomSheet: BottomMessageBar(
        allowPickImage: true,
        controller: controller.messageController,
        onPickImage: () {
          controller.pickImage();
        },
        onSend: () {
          controller.sendImageInput(
            context,
            controller.messageController.text.trim(),
          );
          controller.messageController.text = '';
        },
        onMicTap: () {
          controller.convertSpeechToText(controller.messageController);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 70),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (controller.image != null)
                ChatMessageBubble(item: controller.image!),
              if (controller.query != null)
                ChatMessageBubble(item: controller.query!),
              if (controller.isLoading) const ResponseLoadingShimmer(),
              if (controller.aiResponse != null)
                ChatMessageBubble(
                  item: controller.aiResponse!,
                  onSpeak: () {
                    controller.speak(controller.aiResponse!.message);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
