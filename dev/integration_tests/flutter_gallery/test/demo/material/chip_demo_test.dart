// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_gallery/demo/material/chip_demo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Chip demo has semantic labels', (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(
      MaterialApp(theme: ThemeData(platform: TargetPlatform.iOS), home: const ChipDemo()),
    );

<<<<<<< HEAD
    expect(
      tester.getSemantics(find.byIcon(Icons.vignette)),
      matchesSemantics(
        isButton: true,
        hasEnabledState: true,
        isEnabled: true,
        isFocusable: true,
        hasTapAction: true,
        hasFocusAction: true,
        label: 'Update border shape',
      ),
    );

    expect(
      tester.getSemantics(find.byIcon(Icons.refresh)),
      matchesSemantics(
        isButton: true,
        hasEnabledState: true,
        isEnabled: true,
        isFocusable: true,
        hasTapAction: true,
        hasFocusAction: true,
        label: 'Reset chips',
      ),
    );
=======
    expect(tester.getSemantics(find.byIcon(Icons.vignette)), matchesSemantics(
      isButton: true,
      hasEnabledState: true,
      isEnabled: true,
      isFocusable: true,
      hasTapAction: true,
      label: 'Update border shape',
    ));

    expect(tester.getSemantics(find.byIcon(Icons.refresh)), matchesSemantics(
      isButton: true,
      hasEnabledState: true,
      isEnabled: true,
      isFocusable: true,
      hasTapAction: true,
      label: 'Reset chips',
    ));
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

    handle.dispose();
  });
}
