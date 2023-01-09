import 'package:flutter/material.dart';
import './constants.dart';

class AnaglyphViewStyleData {
  final ColorFilter leftChannelColorFilter;
  final ColorFilter rightChannelColorFilter;
  final Duration transitionDuration;
  final Curve transitionCurve;
  final double depth;
  const AnaglyphViewStyleData({
    this.leftChannelColorFilter = leftChannelTrueColorFilter,
    this.rightChannelColorFilter = rightChannelTrueColorFilter,
    this.transitionDuration = kThemeAnimationDuration,
    this.transitionCurve = Curves.decelerate,
    this.depth = 0,
  });

  AnaglyphViewStyleData copyWith() {
    return const AnaglyphViewStyleData();
  }

  @override
  bool operator ==(Object other) {
    if (other is! AnaglyphViewStyleData) return false;
    return depth == other.depth &&
        leftChannelColorFilter == other.leftChannelColorFilter &&
        rightChannelColorFilter == other.rightChannelColorFilter;
  }

  @override
  int get hashCode =>
      depth.hashCode ^
      leftChannelColorFilter.hashCode ^
      rightChannelColorFilter.hashCode;
}

class AnaglyphStereoPairStyle {
  final AnaglyphStereoChannelStyle leftChannel;
  final AnaglyphStereoChannelStyle rightChannel;
  const AnaglyphStereoPairStyle({
    required this.leftChannel,
    required this.rightChannel,
  });
}

class AnaglyphStereoChannelStyle {
  final ColorFilter colorFilter;
  final Matrix4 transformation;
  AnaglyphStereoChannelStyle({
    required this.colorFilter,
    Matrix4? transformation,
  }) : transformation = transformation ?? Matrix4.identity();
}
