import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini/core/constants/app_colors.dart';
import 'package:gemini/core/enums/gemini_input_type.dart';
import 'package:gemini/core/state_service.dart';
import 'package:gemini/pages/dashboard/dashboard_view_model.dart';
import 'package:gemini/utils/utils.dart';
import 'package:go_router/go_router.dart';

part 'widgets/input_type_listtile.dart';
part 'widgets/continue_button.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    DashboardViewModel controller = ref.watch(
      StateService.instance.dashboardViewModel,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gemini'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Choose input type',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Column(
              children: [
                _inputListTile(
                  'Text Input Only',
                  'For only text based input',
                  controller.inputType,
                  GeminiInputType.text,
                  (val) {
                    controller.setInputType(val);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                _inputListTile(
                  'Text and Image Input',
                  'Inputs involving text and image',
                  controller.inputType,
                  GeminiInputType.textAndImage,
                  (val) {
                    controller.setInputType(val);
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                _longButton('Continue', () {
                  if (controller.verifySelection()) {
                    context.push(controller.getRoute());
                  } else {
                    Utils.instance.showSnackbar(
                      context,
                      'Please select an input type',
                      isError: true,
                    );
                  }
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
