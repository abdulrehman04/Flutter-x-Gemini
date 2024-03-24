import 'package:flutter/material.dart';

class Utils {
  static Utils instance = Utils._();
  Utils._();

  BoxShadow boxShad(double x, double y, double b, {Color? color}) {
    return BoxShadow(
      offset: Offset(x, y),
      blurRadius: b,
      color: color ?? const Color(0xdd000000).withOpacity(0.2),
    );
  }

  showSnackbar(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.redAccent : Colors.lightGreen,
      ),
    );
  }
}
