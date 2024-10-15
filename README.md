# flutter_new_badger

## Getting Started

### iOS

On iOS, the notification permission is required to update the badge.
It is automatically asked when the badge is added or removed.

Please also add the following to your Info.plist:
```xml
<key>UIBackgroundModes</key>
<array>
    <string>remote-notification</string>
</array>
```


### Android

On Android, no official API exists to show a badge in the launcher. But some devices (Samsung, HTC...) support the feature.
<!-- Thanks to the [Shortcut Badger library](https://github.com/leolin310148/ShortcutBadger/), ~ 16 launchers are supported. -->


### Dart

First, you just have to import the package in your dart files with:
```dart
import 'package:flutter_new_badger/flutter_new_badger.dart';
```

Then you can add a badge:
```dart
FlutterBadger.setBadge(1);
```

Remove a badge:
```dart
FlutterBadger.removeBadge();
```

