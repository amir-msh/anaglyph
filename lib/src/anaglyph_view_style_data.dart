import 'package:anaglyph/src/stereo_pair_styles.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

// TODO: add Matrix4? transformation

/// Stores data for [AnaglyphView]
class AnaglyphViewStyleData {
  final AnaglyphStereoPairStyle stereoPairStyle;
  final FilterQuality filterQuality;
  final Duration transitionDuration;
  final Curve transitionCurve;
  final double depth;
  final bool clipOuters;

  /// `stereoPairStyle` : The style of the stereo pair
  /// `filterQuality` : The quality of the applied filters on the widget
  /// `transitionDuration` : The animation duration of the style change
  /// `transitionCurve` : The animation curve of the style change
  /// `dapth` : Defines the 3D dapth
  /// `clipOuters` : Clips the outer parts of the anaglyph widget if true (results in a better appearance)
  const AnaglyphViewStyleData({
    this.stereoPairStyle = kDefaultStereoPairStyle,
    this.filterQuality = kDefaultFilterQuality,
    this.transitionDuration = kDefaultTransitionDuration,
    this.transitionCurve = kDefaultTransitionCurve,
    this.depth = kDefaultDepth,
    this.clipOuters = kDefaultClipOuters,
  });

  /// It helps if you want to change some properties of an existing instance
  AnaglyphViewStyleData copyWith({
    AnaglyphStereoPairStyle? stereoPairStyle,
    FilterQuality? filterQuality,
    Duration? transitionDuration,
    Curve? transitionCurve,
    double? depth,
    bool? clipOuters,
  }) {
    return AnaglyphViewStyleData(
      stereoPairStyle: stereoPairStyle ?? this.stereoPairStyle,
      filterQuality: filterQuality ?? this.filterQuality,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
      depth: depth ?? this.depth,
      clipOuters: clipOuters ?? this.clipOuters,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! AnaglyphViewStyleData) return false;
    return stereoPairStyle == other.stereoPairStyle &&
        filterQuality == other.filterQuality &&
        transitionDuration == other.transitionDuration &&
        transitionCurve == other.transitionCurve &&
        depth == other.depth &&
        clipOuters == other.clipOuters;
  }

  @override
  int get hashCode {
    return Object.hash(
      stereoPairStyle,
      filterQuality,
      transitionDuration,
      transitionCurve,
      depth,
      clipOuters,
    );
  }
}

/// Stores the data of the stereo channels pair
class AnaglyphStereoPairStyle {
  final AnaglyphStereoChannelStyle leftChannel;
  final AnaglyphStereoChannelStyle rightChannel;

  /// Creates a custom [AnaglyphStereoPairStyle].
  const AnaglyphStereoPairStyle({
    required this.leftChannel,
    required this.rightChannel,
  });

  /// Creates a "true anaglyph" stereo pair style.
  const AnaglyphStereoPairStyle.trueAnaglyph({
    this.leftChannel = trueAnaglyphLeftChannelStyle,
    this.rightChannel = trueAnaglyphRightChannelStyle,
  });

  /// Creates a "gray" stereo pair style.
  /// It removes the color data
  const AnaglyphStereoPairStyle.gray({
    this.leftChannel = grayLeftChannelStyle,
    this.rightChannel = grayRightChannelStyle,
  });

  /// Creates a "true color" stereo pair style.
  /// It doesn't remove any color data
  const AnaglyphStereoPairStyle.trueColor({
    this.leftChannel = trueColorLeftChannelStyle,
    this.rightChannel = trueColorRightChannelStyle,
  });

  /// Creates a "half color" stereo pair style.
  /// It decreases saturation by 50%
  const AnaglyphStereoPairStyle.halfColor({
    this.leftChannel = halfColorLeftChannelStyle,
    this.rightChannel = halfColorRightChannelStyle,
  });

  /// Creates a "optimized color" stereo pair style.
  /// It decreases the saturation of the disruptive colors, and it often has the best result!
  const AnaglyphStereoPairStyle.optimizedColor({
    this.leftChannel = optimizedColorLeftChannelStyle,
    this.rightChannel = optimizedColorRightChannelStyle,
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
      leftChannel,
      rightChannel,
    );
  }
}

/// Stores the style of a single anaglyph channel
class AnaglyphStereoChannelStyle {
  final ColorFilter colorFilter;

  const AnaglyphStereoChannelStyle({
    required this.colorFilter,
  });

  @override
  bool operator ==(Object other) {
    if (other is! AnaglyphStereoChannelStyle) return false;
    return colorFilter == other.colorFilter;
  }

  @override
  int get hashCode {
    return colorFilter.hashCode;
  }
}
