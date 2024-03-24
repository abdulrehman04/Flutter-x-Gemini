import 'package:flutter/material.dart';
import 'package:gemini/core/enums/gemini_input_type.dart';
import 'package:gemini/core/routes/route_names.dart';

class DashboardViewModel extends ChangeNotifier {
  GeminiInputType? inputType;

  bool verifySelection() {
    return inputType != null;
  }

  String getRoute() {
    if (inputType == GeminiInputType.text) {
      return RouteNames.instance.textInput;
    }
    return RouteNames.instance.textAndImage;
  }

  void setInputType(GeminiInputType? val) {
    inputType = val;
    notifyListeners();
  }
}
