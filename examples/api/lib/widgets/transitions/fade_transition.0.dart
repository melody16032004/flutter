// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Flutter code sample for [FadeTransition].

void main() => runApp(const FadeTransitionExampleApp());

class FadeTransitionExampleApp extends StatelessWidget {
  const FadeTransitionExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const MaterialApp(home: FadeTransitionExample(duration: duration, curve: curve));
=======
    return const MaterialApp(
      home: FadeTransitionExample(),
    );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
  }
}

class FadeTransitionExample extends StatefulWidget {
<<<<<<< HEAD
  const FadeTransitionExample({required this.duration, required this.curve, super.key});

  final Duration duration;

  final Curve curve;
=======
  const FadeTransitionExample({super.key});
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

  @override
  State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _FadeTransitionExampleState extends State<FadeTransitionExample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
<<<<<<< HEAD
  late final CurvedAnimation _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
=======
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(padding: EdgeInsets.all(8), child: FlutterLogo()),
      ),
    );
  }
}
