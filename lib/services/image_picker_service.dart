import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<Uint8List> pickImageAsBytes() async {
    XFile? file = await pickImage();
    if (file == null) throw 'No image picked';
    return await file.readAsBytes();
  }

  Future<XFile?> pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
