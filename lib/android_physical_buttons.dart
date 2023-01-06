
import 'android_physical_buttons_platform_interface.dart';

class AndroidPhysicalButtons {
  Future<String?> getPlatformVersion() {
    return AndroidPhysicalButtonsPlatform.instance.getPlatformVersion();
  }
}
