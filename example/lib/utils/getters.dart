import 'dart:io' show Platform;

bool get isDesktop =>
    Platform.isLinux ||
    Platform.isFuchsia ||
    Platform.isWindows ||
    Platform.isMacOS;
