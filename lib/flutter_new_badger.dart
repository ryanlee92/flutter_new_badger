
import 'flutter_new_badger_platform_interface.dart';

class FlutterNewBadger {
  static Future<void> setBadge(int count) {
    return FlutterNewBadgerPlatform.instance.setBadge(count);
  }

  static Future<void> removeBadge() {
    return FlutterNewBadgerPlatform.instance.removeBadge();
  }
}
