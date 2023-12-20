
import 'card_detector_platform_interface.dart';

class CardDetector {
  Future<String?> getPlatformVersion() {
    return CardDetectorPlatform.instance.getPlatformVersion();
  }
}
