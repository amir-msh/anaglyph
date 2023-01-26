import 'package:anaglyph/anaglyph.dart';
import 'package:anaglyph/src/anaglyph_view_render.dart';
import 'package:anaglyph/src/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnaglyphView extends StatelessWidget {
  /// Creates a 3D widget of its child.
  /// {@macro anaglyph.styledata.args}
  const AnaglyphView({
    super.key,
    this.stereoPairStyle,
    this.filterQuality,
    this.depth,
    this.clipOuters,
    required this.child,
  });

  final AnaglyphStereoPairStyle? stereoPairStyle;
  final FilterQuality? filterQuality;
  final double? depth;
  final bool? clipOuters;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final stereoPairStyleData = stereoPairStyle ??
        AnaglyphStyle.of(context)?.data.stereoPairStyle ??
        kDefaultStereoPairStyle;

    final filterQualityData = filterQuality ??
        AnaglyphStyle.of(context)?.data.filterQuality ??
        kDefaultFilterQuality;

    final depthData =
        depth ?? AnaglyphStyle.of(context)?.data.depth ?? kDefaultDepth;

    final clipOutersData = clipOuters ??
        AnaglyphStyle.of(context)?.data.clipOuters ??
        kDefaultClipOuters;

    return AnaglyphViewRenderObject(
      key: super.key,
      stereoPairStyle: stereoPairStyleData,
      filterQuality: filterQualityData,
      depth: depthData,
      clipOuters: clipOutersData,
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(DiagnosticsProperty('stereoPairStyle', stereoPairStyle))
      ..add(EnumProperty<FilterQuality>('filterQuality', filterQuality))
      ..add(DoubleProperty('depth', depth))
      ..add(DiagnosticsProperty<bool>('clipOuters', clipOuters));
  }
}
