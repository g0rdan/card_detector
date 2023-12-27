import 'package:flutter_test/flutter_test.dart';
import 'package:card_detector/card_detector_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCardDetectorPlatform
    with MockPlatformInterfaceMixin
    implements CardDetectorPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {}
