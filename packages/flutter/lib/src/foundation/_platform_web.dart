// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui_web' as ui_web;

import '../web.dart' as web;
import 'platform.dart' as platform;

export 'platform.dart' show TargetPlatform;

/// The web implementation of [platform.defaultTargetPlatform].
platform.TargetPlatform get defaultTargetPlatform {
  // To get a better guess at the targetPlatform we need to be able to reference
  // the window, but that won't be available until we fix the platforms
  // configuration for Flutter.
  return platform.debugDefaultTargetPlatformOverride ?? _testPlatform ?? _browserPlatform;
}

final platform.TargetPlatform? _testPlatform = () {
  platform.TargetPlatform? result;
  assert(() {
    if (ui_web.debugEmulateFlutterTesterEnvironment) {
<<<<<<< HEAD
      // Return the overridden operatingSystem in tests, if any...
      if (ui_web.browser.debugOperatingSystemOverride != null) {
        testPlatform = _operatingSystemToTargetPlatform(ui_web.browser.operatingSystem);
      } else {
        // Fall back to `android` for tests.
        testPlatform = platform.TargetPlatform.android;
      }
=======
      result = platform.TargetPlatform.android;
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
    }
    return true;
  }());
  return result;
}();

// Lazy-initialized and forever cached current browser platform.
//
<<<<<<< HEAD
// The computation of `operatingSystem` is cached in the ui_web package;
// this getter may be called dozens of times per frame.
//
// _browserPlatform is lazily initialized, and cached forever.
final platform.TargetPlatform _browserPlatform = _operatingSystemToTargetPlatform(
  ui_web.browser.operatingSystem,
);

// Converts an ui_web.OperatingSystem enum into a platform.TargetPlatform.
platform.TargetPlatform _operatingSystemToTargetPlatform(ui_web.OperatingSystem os) {
  return switch (os) {
    ui_web.OperatingSystem.android => platform.TargetPlatform.android,
    ui_web.OperatingSystem.iOs => platform.TargetPlatform.iOS,
    ui_web.OperatingSystem.linux => platform.TargetPlatform.linux,
    ui_web.OperatingSystem.macOs => platform.TargetPlatform.macOS,
    ui_web.OperatingSystem.windows => platform.TargetPlatform.windows,
    // Resolve 'unknown' OS values to `android`.
    ui_web.OperatingSystem.unknown => platform.TargetPlatform.android,
  };
}
=======
// Computing the platform is expensive as it uses `window.matchMedia`, which
// needs to parse and evaluate a CSS selector. On some devices this takes up to
// 0.20ms. As `defaultTargetPlatform` is routinely called dozens of times per
// frame this value should be cached.
final platform.TargetPlatform _browserPlatform = () {
  final String navigatorPlatform = web.window.navigator.platform.toLowerCase();
  if (navigatorPlatform.startsWith('mac')) {
    return platform.TargetPlatform.macOS;
  }
  if (navigatorPlatform.startsWith('win')) {
    return platform.TargetPlatform.windows;
  }
  if (navigatorPlatform.contains('iphone') ||
      navigatorPlatform.contains('ipad') ||
      navigatorPlatform.contains('ipod')) {
    return platform.TargetPlatform.iOS;
  }
  if (navigatorPlatform.contains('android')) {
    return platform.TargetPlatform.android;
  }
  // Since some phones can report a window.navigator.platform as Linux, fall
  // back to use CSS to disambiguate Android vs Linux desktop. If the CSS
  // indicates that a device has a "fine pointer" (mouse) as the primary
  // pointing device, then we'll assume desktop linux, and otherwise we'll
  // assume Android.
  if (web.window.matchMedia('only screen and (pointer: fine)').matches) {
    return platform.TargetPlatform.linux;
  }
  return platform.TargetPlatform.android;
}();
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
