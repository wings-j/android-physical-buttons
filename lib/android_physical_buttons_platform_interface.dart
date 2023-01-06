import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_physical_buttons_method_channel.dart';

abstract class AndroidPhysicalButtonsPlatform extends PlatformInterface {
  /// Constructs a AndroidPhysicalButtonsPlatform.
  AndroidPhysicalButtonsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidPhysicalButtonsPlatform _instance = MethodChannelAndroidPhysicalButtons();

  /// The default instance of [AndroidPhysicalButtonsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidPhysicalButtons].
  static AndroidPhysicalButtonsPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidPhysicalButtonsPlatform] when
  /// they register themselves.
  static set instance(AndroidPhysicalButtonsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
