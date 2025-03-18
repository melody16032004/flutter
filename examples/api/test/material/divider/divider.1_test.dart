// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_api_samples/material/divider/divider.1.dart' as example;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Horizontal Divider', (WidgetTester tester) async {
<<<<<<< HEAD
    await tester.pumpWidget(const example.DividerExampleApp());
=======
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: example.DividerExampleApp(),
        ),
      ),
    );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

    expect(find.byType(Divider), findsOneWidget);

    // Divider is positioned horizontally.
    Offset card = tester.getBottomLeft(find.byType(Card).first);
    expect(card.dy, tester.getTopLeft(find.byType(Divider)).dy);

    card = tester.getTopLeft(find.byType(Card).last);
    expect(card.dy, tester.getBottomLeft(find.byType(Divider)).dy);
  });
}
