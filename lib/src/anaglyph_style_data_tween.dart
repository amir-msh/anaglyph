import 'package:anaglyph/anaglyph.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnaglyphStyleDataTween extends Tween<AnaglyphStyleData> {
  /// Creates an [AnaglyphStyle] tween.
  ///
  /// The `begin` and `end` properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  AnaglyphStyleDataTween({super.begin, super.end});

  @override
  AnaglyphStyleData lerp(double t) => AnaglyphStyleData.lerp(begin!, end!, t);
}
