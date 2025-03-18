// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_api_samples/widgets/basic/physical_shape.0.dart' as example;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PhysicalShape is an ancestor of the text widget', (WidgetTester tester) async {
<<<<<<< HEAD
    await tester.pumpWidget(const example.PhysicalShapeApp());
=======
    await tester.pumpWidget(
      const MaterialApp(home: example.PhysicalShapeApp()),
    );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

    final PhysicalShape physicalShape = tester.widget<PhysicalShape>(
      find.ancestor(of: find.text('Hello, World!'), matching: find.byType(PhysicalShape)),
    );
    expect(physicalShape.clipper, isNotNull);
    expect(physicalShape.color, Colors.orange);
    expect(physicalShape.elevation, 5.0);
  });
}
