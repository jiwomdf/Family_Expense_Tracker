import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

class PlatformUtil {
  static bool isAndroid() => !kIsWeb && Platform.isAndroid;
  static bool isIOS() => !kIsWeb && Platform.isIOS;
  static bool isWindows() => !kIsWeb && Platform.isWindows;
  static bool isWeb() => kIsWeb;
}
