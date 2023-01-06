import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_physical_buttons/android_physical_buttons_method_channel.dart';

void main() {
  MethodChannelAndroidPhysicalButtons platform = MethodChannelAndroidPhysicalButtons();
  const MethodChannel channel = MethodChannel('android_physical_buttons');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
