import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gemini/core/constants/app_colors.dart';

class BottomMessageBar extends StatelessWidget {
  const BottomMessageBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.allowPickImage = false,
    this.onPickImage,
  });

  final TextEditingController controller;
  final void Function() onSend;
  final bool allowPickImage;
  final void Function()? onPickImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.instance.whiteColor,
      child: Container(
        height: 50,
        color: AppColors.instance.whiteColor,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            allowPickImage
                ? InkWell(
                    onTap: onPickImage,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.instance.subtitleGrey),
                      ),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 8),
                      child: const Icon(
                        Icons.image,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: AppColors.instance.subtitleGrey,
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter message',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onSend,
                      child: Icon(
                        Icons.send,
                        size: 22,
                        color: AppColors.instance.subtitleGrey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
