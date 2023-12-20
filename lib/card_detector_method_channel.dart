import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'card_detector_platform_interface.dart';

/// An implementation of [CardDetectorPlatform] that uses method channels.
class MethodChannelCardDetector extends CardDetectorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('card_detector');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
