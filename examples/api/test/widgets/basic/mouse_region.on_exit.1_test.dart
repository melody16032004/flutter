// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_samples/widgets/basic/mouse_region.on_exit.1.dart' as example;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MouseRegion update mouse hover with a delay', (WidgetTester tester) async {
<<<<<<< HEAD
    await tester.pumpWidget(const example.MouseRegionApp());
=======
    await tester.pumpWidget(
      const MaterialApp(home: example.MouseRegionApp()),
    );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

    expect(find.text('Not hovering'), findsOneWidget);

    final TestGesture gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer();
    await gesture.moveTo(tester.getCenter(find.byType(Container)));
    await tester.pump();

    expect(find.text('Hovering'), findsOneWidget);

    await gesture.moveTo(Offset.zero);
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Not hovering'), findsOneWidget);
  });
}
