// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Flutter code sample for [TweenAnimationBuilder].

void main() => runApp(const TweenAnimationBuilderExampleApp());

class TweenAnimationBuilderExampleApp extends StatelessWidget {
  const TweenAnimationBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TweenAnimationBuilder Sample')),
<<<<<<< HEAD
        body: const Center(child: TweenAnimationBuilderExample()),
=======
        body: const Center(
          child: TweenAnimationBuilderExample(),
        ),
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
      ),
    );
  }
}

class TweenAnimationBuilderExample extends StatefulWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  State<TweenAnimationBuilderExample> createState() => _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState extends State<TweenAnimationBuilderExample> {
<<<<<<< HEAD
  double _targetValue = 24.0;
=======
  double targetValue = 24.0;
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: targetValue),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double size, Widget? child) {
        return IconButton(
          iconSize: size,
          color: Colors.blue,
          icon: child!,
          onPressed: () {
            setState(() {
              targetValue = targetValue == 24.0 ? 48.0 : 24.0;
            });
          },
        );
      },
      child: const Icon(Icons.aspect_ratio),
    );
  }
}
