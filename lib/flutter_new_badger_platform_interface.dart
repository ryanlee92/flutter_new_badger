import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_new_badger_method_channel.dart';

abstract class FlutterNewBadgerPlatform extends PlatformInterface {
  /// Constructs a FlutterNewBadgerPlatform.
  FlutterNewBadgerPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNewBadgerPlatform _instance = MethodChannelFlutterNewBadger();

  /// The default instance of [FlutterNewBadgerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNewBadger].
  static FlutterNewBadgerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNewBadgerPlatform] when
  /// they register themselves.
  static set instance(FlutterNewBadgerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setBadge(int count) {
    throw UnimplementedError('setBadge() has not been implemented.');
  }

  Future<void> removeBadge() {
    throw UnimplementedError('removeBadge() has not been implemented.');
  }
}
