import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini/core/routes/route_names.dart';
import 'package:gemini/pages/dashboard/dashboard_view.dart';
import 'package:gemini/pages/text%20and%20image%20chat/text_and_image_chat_view.dart';
import 'package:gemini/pages/text%20only%20chat/text_chat_view.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class Routes {
  static final routerConfig = Provider((ref) {
    return GoRouter(
      initialLocation: RouteNames.instance.dashboard,
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          path: RouteNames.instance.dashboard,
          name: RouteNames.instance.dashboard,
          builder: (context, state) => const DashboardView(),
        ),
        GoRoute(
          path: RouteNames.instance.textInput,
          name: RouteNames.instance.textInput,
          builder: (context, state) => const TextChatView(),
        ),
        GoRoute(
          path: RouteNames.instance.textAndImage,
          name: RouteNames.instance.textAndImage,
          builder: (context, state) => const TextAndImageView(),
        ),
      ],
    );
  });
}
