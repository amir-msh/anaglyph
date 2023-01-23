import 'package:anaglyph/src/stereo_pair_styles.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

/// Stores an anaglyph style
class AnaglyphStyleData {
  /// {@template anaglyph.styledata.args}
  /// `stereoPairStyle` : The style of the stereo pair.
  ///
  /// `filterQuality` : The quality of the applied filters on the widget.
  ///
  /// `dapth` : Determines the 3D dapth.
  ///
  /// `clipOuters` : Clips the outer parts of the anaglyph widget if true
  /// (results in a better 3D appearance).
  /// {@endtemplate}
  const AnaglyphStyleData({
    this.stereoPairStyle = kDefaultStereoPairStyle,
    this.filterQuality = kDefaultFilterQuality,
    this.depth = kDefaultDepth,
    this.clipOuters = kDefaultClipOuters,
  });

  final AnaglyphStereoPairStyle stereoPairStyle;
  final FilterQuality filterQuality;
  final double depth;
  final bool clipOuters;

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

  /// Linearly interpolate between two `AnaglyphStyleData`s.
  ///
  /// `a` and `b` are the `AnaglyphStyleData` instances you want to
  /// interpolate between.
  ///
  /// The `t` argument represents position on the timeline.
  ///
  /// `depth` is the only value that is accurately interpolated currently.
  static AnaglyphStyleData lerp(
    AnaglyphStyleData a,
    AnaglyphStyleData b,
    double t,
  ) {
    return AnaglyphStyleData(
      clipOuters: t < 0.5 ? a.clipOuters : b.clipOuters,
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

/// Stores the data of a stereo channel pair.
class AnaglyphStereoPairStyle {
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
  ///
  /// It completely removes the color data, resulting a grayscale image.
  const AnaglyphStereoPairStyle.mono({
    this.leftChannel = monoLeftChannelStyle,
    this.rightChannel = monoRightChannelStyle,
  });

  /// Creates a "true color" stereo pair style.
  ///
  /// It does not remove any color data, so the true color is displayed.
  ///
  /// In some images that have reddish colors, it causes double vision.
  const AnaglyphStereoPairStyle.trueColor({
    this.leftChannel = trueColorLeftChannelStyle,
    this.rightChannel = trueColorRightChannelStyle,
  });

  /// Creates a "half color" stereo pair style.
  ///
  /// It decreases reddish colors' saturation to reduce double vision.
  const AnaglyphStereoPairStyle.halfColor({
    this.leftChannel = halfColorLeftChannelStyle,
    this.rightChannel = halfColorRightChannelStyle,
  });

  /// Creates an "optimized color" stereo pair style.
  ///
  /// It reduces the saturation of destructive colors and often has the best results!
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

  /// Defines the style of the left channel.
  final AnaglyphStereoChannelStyle leftChannel;

  /// Defines the style of the right channel
  final AnaglyphStereoChannelStyle rightChannel;

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
  /// Creates an `AnaglyphStereoChannelStyle`.
  ///
  /// It determines how should an anaglyph channel look.
  ///
  /// `colorFilter` : The color filter that'll be applied to the channel.
  const AnaglyphStereoChannelStyle({
    required this.colorFilter,
  });

  /// The color filter that'll be applied to the channel.
  final ColorFilter colorFilter;

  /// Linearly interpolate between two `AnaglyphStereoChannelStyle`s.
  ///
  /// `a` and `b` are the `AnaglyphStereoChannelStyle` instances you want to
  /// interpolate between.
  ///
  /// The `t` argument represents position on the timeline,
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
