import 'package:flutter/material.dart';
import 'package:pwa_install/pwa_install.dart';

Future<void> handlePwa() async {
  PWAInstall().setup(installCallback: () {
    debugPrint('App Installed!');
  });

  var isPwaDownloaded = PWAInstall().installPromptEnabled;
  if (isPwaDownloaded) {
    PWAInstall().promptInstall_();
  }
}
