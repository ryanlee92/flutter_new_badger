import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_new_badger_platform_interface.dart';

/// An implementation of [FlutterNewBadgerPlatform] that uses method channels.
class MethodChannelFlutterNewBadger extends FlutterNewBadgerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_new_badger');

  /// Set badge count
  @override
  Future<void> setBadge(int count) async {
    await methodChannel.invokeMethod<void>('setBadge', {"count": count});
  }

  /// Remove badge
  @override
  Future<void> removeBadge() async {
    await methodChannel.invokeMethod<void>('removeBadge');
  }
}
