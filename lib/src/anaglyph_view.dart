import 'package:anaglyph/anaglyph.dart';
import 'package:anaglyph/src/anaglyph_view_render.dart';
import 'package:anaglyph/src/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Creates a 3D widget of its child
class AnaglyphView extends StatefulWidget {
  final AnaglyphStereoPairStyle? stereoPairStyle;
  final FilterQuality? filterQuality;
  final Duration? transitionDuration;
  final Curve? transitionCurve;
  final double? depth;
  final bool? clipOuters;
  final Widget child;
  const AnaglyphView({
    super.key,
    this.stereoPairStyle,
    this.filterQuality,
    this.transitionDuration,
    this.transitionCurve,
    this.depth,
    this.clipOuters,
    required this.child,
  });

  @override
  State<AnaglyphView> createState() => _AnaglyphViewState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<AnaglyphStereoPairStyle>(
        'stereoPairStyle',
        stereoPairStyle,
      ),
    );
    properties.add(
      DiagnosticsProperty<FilterQuality>(
        'filterQuality',
        filterQuality,
      ),
    );
    properties.add(
      DiagnosticsProperty<Duration>(
        'transitionDuration',
        transitionDuration,
      ),
    );
    properties.add(
      DiagnosticsProperty<Curve>('transitionCurve', transitionCurve),
    );
    properties.add(DiagnosticsProperty<double>('depth', depth));
    properties.add(DiagnosticsProperty<bool>('clipOuters', clipOuters));
  }
}

class _AnaglyphViewState extends State<AnaglyphView>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 1000),
    // );
    super.initState();
  }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.depth == 0.0) return widget.child;

    // TODO: Implement animated changes using the AnimatedTheme's design pattern
    // ImplicitlyAnimatedWidget

    final stereoPairStyle = widget.stereoPairStyle ??
        AnaglyphViewStyle.of(context)?.data.stereoPairStyle ??
        kDefaultStereoPairStyle;

    final filterQuality = widget.filterQuality ??
        AnaglyphViewStyle.of(context)?.data.filterQuality ??
        kDefaultFilterQuality;

    final depth = widget.depth ??
        AnaglyphViewStyle.of(context)?.data.depth ??
        kDefaultDepth;

    final clipOuters = widget.clipOuters ??
        AnaglyphViewStyle.of(context)?.data.clipOuters ??
        kDefaultClipOuters;

    final transitionDuration = widget.transitionDuration ??
        AnaglyphViewStyle.of(context)?.data.transitionDuration ??
        kDefaultTransitionDuration;

    final transitionCurve = widget.transitionCurve ??
        AnaglyphViewStyle.of(context)?.data.transitionCurve ??
        kDefaultTransitionCurve;

    return AnaglyphViewRenderObject(
      key: widget.key,
      stereoPairStyle: stereoPairStyle,
      filterQuality: filterQuality,
      depth: depth,
      clipOuters: clipOuters,
      child: widget.child,
    );
  }
}
