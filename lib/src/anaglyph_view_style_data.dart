import 'package:flutter/material.dart';
import './constants.dart';

// TODO: add default "AnaglyphStereoPairStyle"s
// TODO: add enabled
// TODO: add clip edges

class AnaglyphViewStyleData {
  final AnaglyphStereoPairStyle stereoPairStyle;
  final FilterQuality filterQuality;
  final Duration transitionDuration;
  final Curve transitionCurve;
  final double depth;
  final bool enabled;
  // final bool clip; // Outliers, Extrusions
  const AnaglyphViewStyleData({
    this.stereoPairStyle = const AnaglyphStereoPairStyle(
      leftChannel: AnaglyphStereoChannelStyle(
        colorFilter: leftChannelOptimizedColorFilter,
      ),
      rightChannel: AnaglyphStereoChannelStyle(
        colorFilter: rightChannelOptimizedColorFilter,
      ),
    ),
    this.filterQuality = FilterQuality.medium,
    this.transitionDuration = kThemeAnimationDuration,
    this.transitionCurve = Curves.decelerate,
    this.depth = 0,
    this.enabled = true,
  });

  AnaglyphViewStyleData copyWith() {
    return const AnaglyphViewStyleData();
  }

  @override
  bool operator ==(Object other) {
    if (other is! AnaglyphViewStyleData) return false;
    return depth == other.depth;
  }

  @override
  int get hashCode => Object.hash(depth, filterQuality);
}

class AnaglyphStereoPairStyle {
  final AnaglyphStereoChannelStyle leftChannel;
  final AnaglyphStereoChannelStyle rightChannel;
  const AnaglyphStereoPairStyle({
    required this.leftChannel,
    required this.rightChannel,
  });

  @override
  bool operator ==(Object other) {
    if (other is! AnaglyphStereoPairStyle) return false;
    return leftChannel == other.leftChannel &&
        rightChannel == other.rightChannel;
  }

  @override
  int get hashCode {
    return Object.hash(
      leftChannel.hashCode,
      rightChannel.hashCode,
    );
  }
}

class AnaglyphStereoChannelStyle {
  final ColorFilter colorFilter;
  final Matrix4? transformation;
  const AnaglyphStereoChannelStyle({
    required this.colorFilter,
    this.transformation,
  });

  @override
  bool operator ==(Object other) {
    if (other is! AnaglyphStereoChannelStyle) return false;
    return colorFilter == other.colorFilter &&
        transformation == other.transformation;
  }

  @override
  int get hashCode {
    return Object.hash(
      transformation.hashCode,
      colorFilter.hashCode,
    );
  }
}
