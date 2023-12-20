import 'package:flutter_test/flutter_test.dart';
import 'package:card_detector/card_detector.dart';
import 'package:card_detector/card_detector_platform_interface.dart';
import 'package:card_detector/card_detector_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCardDetectorPlatform
    with MockPlatformInterfaceMixin
    implements CardDetectorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CardDetectorPlatform initialPlatform = CardDetectorPlatform.instance;

  test('$MethodChannelCardDetector is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCardDetector>());
  });

  test('getPlatformVersion', () async {
    CardDetector cardDetectorPlugin = CardDetector();
    MockCardDetectorPlatform fakePlatform = MockCardDetectorPlatform();
    CardDetectorPlatform.instance = fakePlatform;

    expect(await cardDetectorPlugin.getPlatformVersion(), '42');
  });
}
