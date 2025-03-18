// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedAlign].

void main() => runApp(const AnimatedAlignExampleApp());

class AnimatedAlignExampleApp extends StatelessWidget {
  const AnimatedAlignExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AnimatedAlign Sample')),
<<<<<<< HEAD
        body: const AnimatedAlignExample(duration: duration, curve: curve),
=======
        body: const AnimatedAlignExample(),
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
      ),
    );
  }
}

class AnimatedAlignExample extends StatefulWidget {
<<<<<<< HEAD
  const AnimatedAlignExample({required this.duration, required this.curve, super.key});

  final Duration duration;

  final Curve curve;
=======
  const AnimatedAlignExample({super.key});
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Container(
          width: 250.0,
          height: 250.0,
          color: Colors.red,
          child: AnimatedAlign(
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(size: 50.0),
          ),
        ),
      ),
    );
  }
}
