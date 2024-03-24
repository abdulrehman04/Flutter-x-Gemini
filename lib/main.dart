import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini/core/constants/app_colors.dart';
import 'package:gemini/core/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // Allows us to monitor the state of our router file
    final router = ref.read(Routes.routerConfig);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Gemini with Riverpod!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.instance.primaryColor,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
