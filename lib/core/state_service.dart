import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini/pages/dashboard/dashboard_view_model.dart';
import 'package:gemini/pages/text%20and%20image%20chat/text_and_image_chat_view_model.dart';
import 'package:gemini/pages/text%20only%20chat/text_chat_view_model.dart';

class StateService {
  static StateService instance = StateService._();

  StateService._();

  final dashboardViewModel = ChangeNotifierProvider((ref) {
    return DashboardViewModel();
  });

  final textChatViewModel = ChangeNotifierProvider((ref) {
    return TextChatViewModel();
  });

  final textAndImageChatViewModel = ChangeNotifierProvider((ref) {
    return TextAndImageViewModel();
  });
}
