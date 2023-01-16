import 'package:anaglyph/src/stereo_pair_styles.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

// TODO: add Matrix4? transformation

/// Stores data for [AnaglyphView]
class AnaglyphStyleData {
  final AnaglyphStereoPairStyle stereoPairStyle;
  final FilterQuality filterQuality;
  final double depth;
  final bool clipOuters;

  /// `stereoPairStyle` : The style of the stereo pair
  ///
  /// `filterQuality` : The quality of the applied filters on the widget
  ///
  /// `transitionDuration` : The animation duration of the style change
  ///
  /// `transitionCurve` : The animation curve of the style change
  ///
  /// `dapth` : Defines the 3D dapth
  ///
  /// `clipOuters` : Clips the outer parts of the anaglyph widget if true (results in a better appearance)
  const AnaglyphStyleData({
    this.stereoPairStyle = kDefaultStereoPairStyle,
    this.filterQuality = kDefaultFilterQuality,
    this.depth = kDefaultDepth,
    this.clipOuters = kDefaultClipOuters,
  });

  /// It helps if you want to change some properties of an existing instance
  AnaglyphStyleData copyWith({
    AnaglyphStereoPairStyle? stereoPairStyle,
    FilterQuality? filterQuality,
    Duration? transitionDuration,
    Curve? transitionCurve,
    double? depth,
    bool? clipOuters,
  }) {
    return AnaglyphStyleData(
      stereoPairStyle: stereoPairStyle ?? this.stereoPairStyle,
      filterQuality: filterQuality ?? this.filterQuality,
      depth: depth ?? this.depth,
      clipOuters: clipOuters ?? this.clipOuters,
    );
  }

  static AnaglyphStyleData lerp(
    AnaglyphStyleData a,
    AnaglyphStyleData b,
    double t,
  ) {
    return AnaglyphStyleData(
      clipOuters: b.clipOuters,
      depth: Tween<double>(
        begin: a.depth,
        end: b.depth,
      ).transform(t),
      filterQuality: t < 0.5 ? a.filterQuality : b.filterQuality,
      stereoPairStyle: b.stereoPairStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is! AnaglyphStyleData) return false;
    return stereoPairStyle == other.stereoPairStyle &&
        filterQuality == other.filterQuality &&
        depth == other.depth &&
        clipOuters == other.clipOuters;
  }

  @override
  int get hashCode {
    return Object.hash(
      stereoPairStyle,
      filterQuality,
      depth,
      clipOuters,
    );
  }
}

/// Stores the data of the stereo channel pairs
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

  /// Creates a "mono" stereo pair style.
  /// It removes the color data
  const AnaglyphStereoPairStyle.mono({
    this.leftChannel = monoLeftChannelStyle,
    this.rightChannel = monoRightChannelStyle,
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

  static AnaglyphStereoPairStyle lerp(
    AnaglyphStereoPairStyle a,
    AnaglyphStereoPairStyle b,
    double t,
  ) {
    return AnaglyphStereoPairStyle(
      leftChannel: AnaglyphStereoChannelStyle.lerp(
        a.leftChannel,
        b.leftChannel,
        t,
      ),
      rightChannel: AnaglyphStereoChannelStyle.lerp(
        a.rightChannel,
        b.rightChannel,
        t,
      ),
    );
  }

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

  static AnaglyphStereoChannelStyle lerp(
    AnaglyphStereoChannelStyle a,
    AnaglyphStereoChannelStyle b,
    double t,
  ) {
    return AnaglyphStereoChannelStyle(
      colorFilter: t < 0.5 ? a.colorFilter : b.colorFilter,
    );
  }

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
