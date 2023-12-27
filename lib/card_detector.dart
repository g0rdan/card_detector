import 'dart:typed_data';
import 'dart:ui';

import 'package:card_detector/models/credit_card.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class CardDetector {
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  Future<CreditCard?> lookup({
    required Uint8List bytes,
    required int imageWidth,
    required int imageHeight,
    required InputImageRotation rotation,
    required InputImageFormat format,
    required int bytesPerRow,
  }) async {
    var creditCard = const CreditCard();
    final inputImage = InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: Size(imageWidth.toDouble(), imageHeight.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: bytesPerRow,
      ),
    );
    final recognizedText = await _textRecognizer.processImage(inputImage);

    for (var block in recognizedText.blocks) {
      for (var line in block.lines) {
        for (var element in line.elements) {
          final text = element.text;
          final expDateRefex = RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$');
          if (expDateRefex.hasMatch(text)) {
            creditCard = creditCard.copyWith(
              expiryDate: text,
            );
          }
        }
      }
    }

    if (!creditCard.isEmpty) {
      return creditCard;
    }

    return null;
  }
}
