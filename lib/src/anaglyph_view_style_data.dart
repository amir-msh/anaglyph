import 'package:anaglyph/src/stereo_pair_styles.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

// TODO: add Matrix4? transformation

class AnaglyphViewStyleData {
  final AnaglyphStereoPairStyle stereoPairStyle;
  final FilterQuality filterQuality;
  final Duration transitionDuration;
  final Curve transitionCurve;
  final double depth;
  final bool clipOuters;

  const AnaglyphViewStyleData({
    this.stereoPairStyle = kDefaultStereoPairStyle,
    this.filterQuality = kDefaultFilterQuality,
    this.transitionDuration = kDefaultTransitionDuration,
    this.transitionCurve = kDefaultTransitionCurve,
    this.depth = kDefaultDepth,
    this.clipOuters = kDefaultClipOuters,
  });

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

class AnaglyphStereoPairStyle {
  final AnaglyphStereoChannelStyle leftChannel;
  final AnaglyphStereoChannelStyle rightChannel;

  const AnaglyphStereoPairStyle({
    required this.leftChannel,
    required this.rightChannel,
  });

  const AnaglyphStereoPairStyle.trueAnaglyph({
    this.leftChannel = trueAnaglyphLeftChannelStyle,
    this.rightChannel = trueAnaglyphRightChannelStyle,
  });

  const AnaglyphStereoPairStyle.gray({
    this.leftChannel = grayLeftChannelStyle,
    this.rightChannel = grayRightChannelStyle,
  });

  const AnaglyphStereoPairStyle.trueColor({
    this.leftChannel = trueColorLeftChannelStyle,
    this.rightChannel = trueColorRightChannelStyle,
  });

  const AnaglyphStereoPairStyle.halfColor({
    this.leftChannel = halfColorLeftChannelStyle,
    this.rightChannel = halfColorRightChannelStyle,
  });

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
