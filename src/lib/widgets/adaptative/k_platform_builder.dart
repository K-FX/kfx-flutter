import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class KPlatformBuilder extends StatelessWidget {
  const KPlatformBuilder({required this.iosBuilder, required this.androidBuilder, super.key});

  final Widget Function(BuildContext context, KPlatformInfo platformInfo) iosBuilder;
  final Widget Function(BuildContext context, KPlatformInfo platformInfo) androidBuilder;

  @override
  Widget build(BuildContext context) {
    late Widget Function(BuildContext context, KPlatformInfo platformInfo) builder;

    if (Platform.isMacOS || Platform.isIOS) {
      builder = iosBuilder;
    } else {
      builder = androidBuilder;
    }

    late OSPlatform osPlatform;
    late String languageCode;
    late String osVersion;

    if (Platform.isAndroid) {
      osPlatform = OSPlatform.android;
    } else if (Platform.isIOS) {
      osPlatform = OSPlatform.ios;
    } else if (Platform.isWindows) {
      osPlatform = OSPlatform.windows;
    } else if (Platform.isMacOS) {
      osPlatform = OSPlatform.macos;
    } else if (Platform.isLinux) {
      osPlatform = OSPlatform.linux;
    } else if (Platform.isFuchsia) {
      osPlatform = OSPlatform.fucshia;
    } else {
      throw PlatformException(code: "unknown-platform", message: "${Platform.operatingSystem} is not supported");
    }

    languageCode = Platform.localeName.split("_").first;
    osVersion = Platform.operatingSystemVersion;

    return builder(context, KPlatformInfo(languageCode: languageCode, osPlatform: osPlatform, osVersion: osVersion));
  }
}

class KPlatformInfo {
  KPlatformInfo({required this.languageCode, required this.osPlatform, required this.osVersion});

  final String languageCode;

  final OSPlatform osPlatform;

  final String osVersion;
}

enum OSPlatform {
  android,
  ios,
  fucshia,
  windows,
  linux,
  macos,
}
