import 'package:anaglyph/anaglyph.dart';
import 'package:anaglyph/src/anaglyph_view_render.dart';
import 'package:anaglyph/src/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Adds a 3D anaglyph effect to its child
///
/// ## Dynamic Size
///
/// Changing the `depth` in either positive or negative direction will increase the width of
/// the canvas by `depth.abs()/2`, but will not change the size of the [AnaglyphView] widget.
/// If you want the size of the [AnaglyphView] widget to be the same as the size of the canvas,
/// you can write a widget like this:
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

  /// The style of the stereo pair
  final AnaglyphStereoPairStyle? stereoPairStyle;

  /// The quality of the filters applied to the widget
  final FilterQuality? filterQuality;

  /// Sets the 3D depth
  final double? depth;

  /// Clips the outer parts of the anaglyph widget if true
  final bool? clipOuters;

  /// Anaglyph effect will be applied to this widget
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
