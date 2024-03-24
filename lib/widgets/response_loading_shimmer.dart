import 'package:flutter/material.dart';
import 'package:gemini/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ResponseLoadingShimmer extends StatelessWidget {
  const ResponseLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
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
                    color: AppColors.instance.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
