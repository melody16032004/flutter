// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// @docImport 'package:flutter/material.dart';
library;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

/// The position information for a text selection toolbar.
///
/// Typically, a menu will attempt to position itself at [primaryAnchor], and
/// if that's not possible, then it will use [secondaryAnchor] instead, if it
/// exists.
///
/// See also:
///
///  * [AdaptiveTextSelectionToolbar.anchors], which is of this type.
@immutable
class TextSelectionToolbarAnchors {
  /// Creates an instance of [TextSelectionToolbarAnchors] directly from the
  /// anchor points.
  const TextSelectionToolbarAnchors({required this.primaryAnchor, this.secondaryAnchor});

  /// Creates an instance of [TextSelectionToolbarAnchors] for some selection.
  factory TextSelectionToolbarAnchors.fromSelection({
    required RenderBox renderBox,
    required double startGlyphHeight,
    required double endGlyphHeight,
    required List<TextSelectionPoint> selectionEndpoints,
  }) {
    final Rect editingRegion = Rect.fromPoints(
      renderBox.localToGlobal(Offset.zero),
      renderBox.localToGlobal(renderBox.size.bottomRight(Offset.zero)),
    );

    if (editingRegion.left.isNaN || editingRegion.top.isNaN
      || editingRegion.right.isNaN || editingRegion.bottom.isNaN) {
      return const TextSelectionToolbarAnchors(primaryAnchor: Offset.zero);
    }

    final bool isMultiline = selectionEndpoints.last.point.dy - selectionEndpoints.first.point.dy >
        endGlyphHeight / 2;

    final Rect selectionRect = Rect.fromLTRB(
      isMultiline
          ? editingRegion.left
          : editingRegion.left + selectionEndpoints.first.point.dx,
      editingRegion.top + selectionEndpoints.first.point.dy - startGlyphHeight,
      isMultiline
          ? editingRegion.right
          : editingRegion.left + selectionEndpoints.last.point.dx,
      editingRegion.top + selectionEndpoints.last.point.dy,
    );

    return TextSelectionToolbarAnchors(
      primaryAnchor: Offset(
        selectionRect.left + selectionRect.width / 2,
        clampDouble(selectionRect.top, editingRegion.top, editingRegion.bottom),
      ),
      secondaryAnchor: Offset(
        selectionRect.left + selectionRect.width / 2,
        clampDouble(selectionRect.bottom, editingRegion.top, editingRegion.bottom),
      ),
    );
  }

<<<<<<< HEAD
  /// Returns the [Rect] of the [RenderBox] in global coordinates.
  static Rect _getEditingRegion(RenderBox renderBox) {
    return Rect.fromPoints(
      renderBox.localToGlobal(Offset.zero),
      renderBox.localToGlobal(renderBox.size.bottomRight(Offset.zero)),
    );
  }

  /// Returns the [Rect] covering the given selection in the given [RenderBox]
  /// in global coordinates.
  static Rect getSelectionRect(
    RenderBox renderBox,
    double startGlyphHeight,
    double endGlyphHeight,
    List<TextSelectionPoint> selectionEndpoints,
  ) {
    final Rect editingRegion = _getEditingRegion(renderBox);

    if (editingRegion.left.isNaN ||
        editingRegion.top.isNaN ||
        editingRegion.right.isNaN ||
        editingRegion.bottom.isNaN) {
      return Rect.zero;
    }

    final bool isMultiline =
        selectionEndpoints.last.point.dy - selectionEndpoints.first.point.dy > endGlyphHeight / 2;

    return Rect.fromLTRB(
      isMultiline ? editingRegion.left : editingRegion.left + selectionEndpoints.first.point.dx,
      editingRegion.top + selectionEndpoints.first.point.dy - startGlyphHeight,
      isMultiline ? editingRegion.right : editingRegion.left + selectionEndpoints.last.point.dx,
      editingRegion.top + selectionEndpoints.last.point.dy,
    );
  }

=======
>>>>>>> 0a545b201052d8de3d0d76a04bc0911a062242c8
  /// The location that the toolbar should attempt to position itself at.
  ///
  /// If the toolbar doesn't fit at this location, use [secondaryAnchor] if it
  /// exists.
  final Offset primaryAnchor;

  /// The fallback position that should be used if [primaryAnchor] doesn't work.
  final Offset? secondaryAnchor;
}
