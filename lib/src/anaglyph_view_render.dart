import 'package:anaglyph/anaglyph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnaglyphViewRenderObject extends SingleChildRenderObjectWidget {
  final AnaglyphStereoPairStyle stereoPairStyle;
  final FilterQuality filterQuality;
  final double depth;
  final bool clipOuters;

  const AnaglyphViewRenderObject({
    required super.key,
    required this.stereoPairStyle,
    required this.filterQuality,
    required this.depth,
    required this.clipOuters,
    required super.child,
  });

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
      ..add(StringProperty('stereoPairStyle', stereoPairStyle.toString()))
      ..add(EnumProperty<FilterQuality>('filterQuality', filterQuality))
      ..add(DoubleProperty('depth', depth))
      ..add(StringProperty('clipOuters', clipOuters.toString()));
  }
}

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
  }

  set filterQuality(FilterQuality newValue) {
    _filterQuality = newValue;
  }

  set anaglyphDepth(double newValue) {
    _anaglyphDepth = newValue;
  }

  set clipOuters(bool newValue) {
    _clipOuters = newValue;
  }

  @override
  void paint(context, offset) {
    final renderOffset = _anaglyphDepth.abs() + 1;
    final offsetChange = _clipOuters ? Offset(renderOffset, 0) : Offset.zero;

    context.canvas.saveLayer(
      offset - offsetChange & size,
      Paint()
        ..isAntiAlias = false
        ..colorFilter = _stereoPairStyle.leftChannel.colorFilter
        ..filterQuality = _filterQuality,
    );

    super.paint(context, offset + Offset(-_anaglyphDepth, 0));
    context.canvas.restore();

    context.canvas.saveLayer(
      offset + offsetChange & size,
      Paint()
        ..isAntiAlias = false
        ..blendMode = BlendMode.plus
        ..color = Colors.white
        ..colorFilter = _stereoPairStyle.rightChannel.colorFilter
        ..filterQuality = _filterQuality,
    );

    super.paint(context, offset + Offset(_anaglyphDepth, 0));
    context.canvas.restore();
  }
}
