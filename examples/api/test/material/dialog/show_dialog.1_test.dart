// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_api_samples/material/dialog/show_dialog.1.dart' as example;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Show dialog', (WidgetTester tester) async {
    const String dialogTitle = 'Basic dialog title';
<<<<<<< HEAD
    await tester.pumpWidget(const example.ShowDialogExampleApp());
=======
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: example.ShowDialogExampleApp(),
        ),
      ),
    );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

    expect(find.text(dialogTitle), findsNothing);

    await tester.tap(find.widgetWithText(OutlinedButton, 'Open Dialog'));
    await tester.pumpAndSettle();
    expect(find.text(dialogTitle), findsOneWidget);

    await tester.tap(find.text('Enable'));
    await tester.pumpAndSettle();
    expect(find.text(dialogTitle), findsNothing);
  });
}
