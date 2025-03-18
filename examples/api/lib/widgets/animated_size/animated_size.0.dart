// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedSize].

void main() => runApp(const AnimatedSizeExampleApp());

class AnimatedSizeExampleApp extends StatelessWidget {
  const AnimatedSizeExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AnimatedSize Sample')),
<<<<<<< HEAD
        body: const Center(child: AnimatedSizeExample(duration: duration, curve: curve)),
=======
        body: const Center(
          child: AnimatedSizeExample(),
        ),
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
      ),
    );
  }
}

class AnimatedSizeExample extends StatefulWidget {
<<<<<<< HEAD
  const AnimatedSizeExample({required this.duration, required this.curve, super.key});

  final Duration duration;

  final Curve curve;
=======
  const AnimatedSizeExample({super.key});
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

  @override
  State<AnimatedSizeExample> createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample> {
  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _updateSize(),
      child: ColoredBox(
        color: Colors.amberAccent,
        child: AnimatedSize(
<<<<<<< HEAD
          duration: widget.duration,
          curve: widget.curve,
          child: SizedBox.square(
            dimension: _isSelected ? 250.0 : 100.0,
            child: const Center(child: FlutterLogo(size: 75.0)),
          ),
=======
          curve: Curves.easeIn,
          duration: const Duration(seconds: 1),
          child: FlutterLogo(size: _size),
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
        ),
      ),
    );
  }
}
