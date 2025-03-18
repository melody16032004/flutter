// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class Scrim extends StatelessWidget {
  const Scrim({super.key, required this.controller});

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return ExcludeSemantics(
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          final Color color =
              const Color(0xFFFFF0EA).withOpacity(controller.value * 0.87);

<<<<<<< HEAD
          switch (controller.status) {
            case AnimationStatus.completed:
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(onTap: controller.reverse, child: scrimRectangle),
              );
            case AnimationStatus.dismissed:
              return IgnorePointer(child: scrimRectangle);
            case AnimationStatus.forward || AnimationStatus.reverse:
              return scrimRectangle;
=======
          final Widget scrimRectangle = Container(
              width: deviceSize.width, height: deviceSize.height, color: color);

          final bool ignorePointer =
              (controller.status == AnimationStatus.dismissed);
          final bool tapToRevert = (controller.status == AnimationStatus.completed);

          if (tapToRevert) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  controller.reverse();
                },
                child: scrimRectangle,
              ),
            );
          } else if (ignorePointer) {
            return IgnorePointer(child: scrimRectangle);
          } else {
            return scrimRectangle;
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
          }
        },
      ),
    );
  }
}
