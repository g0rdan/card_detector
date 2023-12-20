import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'card_detector_method_channel.dart';

abstract class CardDetectorPlatform extends PlatformInterface {
  /// Constructs a CardDetectorPlatform.
  CardDetectorPlatform() : super(token: _token);

  static final Object _token = Object();

  static CardDetectorPlatform _instance = MethodChannelCardDetector();

  /// The default instance of [CardDetectorPlatform] to use.
  ///
  /// Defaults to [MethodChannelCardDetector].
  static CardDetectorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CardDetectorPlatform] when
  /// they register themselves.
  static set instance(CardDetectorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
