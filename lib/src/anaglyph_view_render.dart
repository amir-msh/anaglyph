import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:anaglyph/anaglyph.dart';

/// Renders the [AnaglyphView] widget.
class AnaglyphViewRenderObject extends SingleChildRenderObjectWidget {
  const AnaglyphViewRenderObject({
    required super.key,
    required this.stereoPairStyle,
    required this.filterQuality,
    required this.depth,
    required this.clipOuters,
    required super.child,
  });

  final AnaglyphStereoPairStyle stereoPairStyle;
  final FilterQuality filterQuality;
  final double depth;
  final bool clipOuters;

  @override
  RenderObject createRenderObject(final BuildContext context) {
    return RenderAnaglyphView(
      stereoPairStyle: stereoPairStyle,
      filterQuality: filterQuality,
      anaglyphDepth: depth,
      clipOuters: clipOuters,
    );
  }

  @override
  void updateRenderObject(
    final BuildContext context,
    final RenderAnaglyphView renderObject,
  ) {
    renderObject
      ..stereoPairStyle = stereoPairStyle
      ..filterQuality = filterQuality
      ..anaglyphDepth = depth
      ..clipOuters = clipOuters;
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

/// Proxy box for [AnaglyphViewRenderObject] widget
class RenderAnaglyphView extends RenderProxyBox {
  AnaglyphStereoPairStyle _stereoPairStyle;
  FilterQuality _filterQuality;
  double _anaglyphDepth;
  bool _clipOuters;

  RenderAnaglyphView({
    required AnaglyphStereoPairStyle stereoPairStyle,
    required FilterQuality filterQuality,
    required double anaglyphDepth,
    required bool clipOuters,
  })  : _stereoPairStyle = stereoPairStyle,
        _filterQuality = filterQuality,
        _anaglyphDepth = anaglyphDepth,
        _clipOuters = clipOuters;

  set stereoPairStyle(AnaglyphStereoPairStyle newValue) {
    _stereoPairStyle = newValue;
    markNeedsPaint();
  }

  set filterQuality(FilterQuality newValue) {
    _filterQuality = newValue;
    markNeedsPaint();
  }

  set anaglyphDepth(double newValue) {
    _anaglyphDepth = newValue;
    markNeedsPaint();
  }

  set clipOuters(bool newValue) {
    _clipOuters = newValue;
    markNeedsPaint();
  }

  @override
  void paint(context, offset) {
    const antialiase = false;
    final halfDepth = _anaglyphDepth / 2;
    final offsetChange =
        _clipOuters ? Offset(-halfDepth, 0) : Offset(halfDepth, 0);

    context.canvas.saveLayer(
      (offset - offsetChange) & size,
      Paint()
        ..isAntiAlias = antialiase
        ..colorFilter = _stereoPairStyle.leftChannel.colorFilter
        ..filterQuality = _filterQuality,
    );

    super.paint(context, offset + Offset(-halfDepth, 0));
    context.canvas.restore();

    context.canvas.saveLayer(
      (offset + offsetChange) & size,
      Paint()
        ..isAntiAlias = antialiase
        ..blendMode = BlendMode.plus
        ..color = Colors.white
        ..colorFilter = _stereoPairStyle.rightChannel.colorFilter
        ..filterQuality = _filterQuality,
    );

    super.paint(context, offset + Offset(halfDepth, 0));
    context.canvas.restore();
  }
}
