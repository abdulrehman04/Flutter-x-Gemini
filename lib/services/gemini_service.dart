import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  // Creating a singleton
  static GeminiService instance = GeminiService._();
  GeminiService._() {
    _initService();
  }
  late GenerativeModel textModel;
  late GenerativeModel textAndImageModel;

  void _initService() {
    String key = dotenv.env['GEMINI_API_KEY'] ?? '';
    if (key.isEmpty) {
      throw Exception('GEMINI_API_KEY not found');
    }
    textModel = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: key,
    );
    textAndImageModel = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: key,
    );
  }

  Future<String> generateTextContent(String input) async {
    GenerateContentResponse response = await textModel.generateContent(
      [Content.text(input)],
    );
    if (response.text != null) {
      return response.text ?? '';
    }
    return response.promptFeedback!.blockReasonMessage!;
  }

  Future<String> generateTextAndImageContent(
    String prompt,
    DataPart imageData,
  ) async {
    final text = TextPart(prompt);
    final response = await textAndImageModel.generateContent([
      Content.multi([text, imageData])
    ]);

    if (response.text != null) {
      return response.text ?? '';
    }
    return response.promptFeedback!.blockReasonMessage!;
  }
}
