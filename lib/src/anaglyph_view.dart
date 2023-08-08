import 'package:anaglyph/anaglyph.dart';
import 'package:anaglyph/src/anaglyph_view_render.dart';
import 'package:anaglyph/src/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Adds 3D anaglyph effect to its child
///
/// ## Dynamic Size
///
/// By increasing the `depth` in both positive or negative directions, the size of the
/// canvas increases by `depth.abs()/2`, but the size of [AnaglyphView] widget does
/// not change. If you want the size of the [AnaglyphView] widget match the size of canvas,
/// you can write a widget as shown below :
///
/// ```dart
/// class SizedAnaglyphView extends StatelessWidget {
///   final Widget child;
///   final double? depth;
///   static const double defaultDepth = -3;
///
///   const SizedAnaglyphView({
///     super.key,
///     required this.child,
///     this.depth,
///   });
///
///   @override
///   Widget build(BuildContext context) {
///     final depthData =
///         depth ?? AnaglyphStyle.of(context)?.data.depth ?? defaultDepth;
///     return AnaglyphView(
///       depth: depthData,
///       clipOuters: false,
///       child: Padding(
///         padding: EdgeInsets.symmetric(
///           horizontal: depthData.abs() / 2,
///         ),
///         child: child,
///       ),
///     );
///   }
/// }
/// ```
///
class AnaglyphView extends StatelessWidget {
  /// Creates a 3D widget of its child.
  ///
  /// {@macro anaglyph.styledata.args}
  ///

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
