import 'package:anaglyph/anaglyph.dart';
import 'package:anaglyph/src/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimatedAnaglyphStyle extends ImplicitlyAnimatedWidget {
  /// Creates an animated [AnaglyphStyle].
  ///
  /// By default, it uses a decelerate curve. The [data] and [child] arguments
  /// must not be null.
  ///
  /// `curve` : the animation curve that will be used for the transition animation.
  ///
  /// `duration` : the duration of the transition animation.
  const AnimatedAnaglyphStyle({
    super.key,
    required this.data,
    super.curve = kDefaultTransitionCurve,
    super.duration = kDefaultTransitionDuration,
    super.onEnd,
    required this.child,
  });

  /// Specifies the style of anaglyph
  final AnaglyphStyleData data;

  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  @override
  AnimatedWidgetBaseState<AnimatedAnaglyphStyle> createState() {
    return _AnimatedThemeState();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AnaglyphStyleData>('data', data));
    properties.add(DiagnosticsProperty<Duration>('duration', duration));
    properties.add(DiagnosticsProperty<Curve>('curve', curve));
    properties.add(DiagnosticsProperty<VoidCallback?>('onEnd', onEnd));
  }
}

class _AnimatedThemeState
    extends AnimatedWidgetBaseState<AnimatedAnaglyphStyle> {
  AnaglyphStyleDataTween? _dataTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _dataTween = visitor(
      _dataTween,
      widget.data,
      (dynamic value) => AnaglyphStyleDataTween(
        begin: value as AnaglyphStyleData,
      ),
    )! as AnaglyphStyleDataTween;
  }

  @override
  Widget build(BuildContext context) {
    return AnaglyphStyle(
      data: _dataTween!.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(
      DiagnosticsProperty<AnaglyphStyleDataTween>('_dataTween', _dataTween),
    );
  }
}
