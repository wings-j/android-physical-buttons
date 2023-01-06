import 'package:flutter_test/flutter_test.dart';
import 'package:android_physical_buttons/android_physical_buttons.dart';
import 'package:android_physical_buttons/android_physical_buttons_platform_interface.dart';
import 'package:android_physical_buttons/android_physical_buttons_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidPhysicalButtonsPlatform 
    with MockPlatformInterfaceMixin
    implements AndroidPhysicalButtonsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AndroidPhysicalButtonsPlatform initialPlatform = AndroidPhysicalButtonsPlatform.instance;

  test('$MethodChannelAndroidPhysicalButtons is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidPhysicalButtons>());
  });

  test('getPlatformVersion', () async {
    AndroidPhysicalButtons androidPhysicalButtonsPlugin = AndroidPhysicalButtons();
    MockAndroidPhysicalButtonsPlatform fakePlatform = MockAndroidPhysicalButtonsPlatform();
    AndroidPhysicalButtonsPlatform.instance = fakePlatform;
  
    expect(await androidPhysicalButtonsPlugin.getPlatformVersion(), '42');
  });
}
