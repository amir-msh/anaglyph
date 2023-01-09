import 'package:anaglyph/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnaglyphView extends StatelessWidget {
  final double opacity;
  final BlendMode blendMode;
  final FilterQuality filterQuality;
  final double depth;
  final bool enabled;
  final Widget child;
  const AnaglyphView({
    super.key,
    this.opacity = 1,
    this.blendMode = BlendMode.plus,
    this.filterQuality = FilterQuality.high,
    this.depth = -3,
    this.enabled = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    if (enabled) {
      return _AnaglyphViewRenderObject(
        key: key,
        opacity: opacity,
        blendMode: blendMode,
        depth: depth,
        filterQuality: filterQuality,
        child: child,
      );
    } else {
      return child;
    }
  }
}

class _AnaglyphViewRenderObject extends SingleChildRenderObjectWidget {
  final double opacity;
  final BlendMode blendMode;
  final double depth;
  final FilterQuality filterQuality;

  const _AnaglyphViewRenderObject({
    required this.blendMode,
    required this.opacity,
    required this.depth,
    required this.filterQuality,
    required super.child,
    required super.key,
  });

  @override
  RenderObject createRenderObject(final BuildContext context) {
    return RenderAnaglyphView(
      blendMode,
      opacity,
      depth,
      filterQuality,
    );
  }

  @override
  void updateRenderObject(
    final BuildContext context,
    final RenderAnaglyphView renderObject,
  ) {
    renderObject
      ..blendMode = blendMode
      ..opacity = opacity
      ..renderDepth = depth
      ..filterQuality = filterQuality;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<BlendMode>('blendMode', blendMode))
      ..add(DoubleProperty('opacity', opacity))
      ..add(DoubleProperty('depth', depth))
      ..add(EnumProperty<FilterQuality>('filterQuality', filterQuality));
  }
}

class RenderAnaglyphView extends RenderProxyBox {
  BlendMode blendMode;
  double opacity;
  double renderDepth;
  FilterQuality filterQuality;

  RenderAnaglyphView(
    this.blendMode,
    this.opacity,
    this.renderDepth,
    this.filterQuality,
  );

  @override
  void paint(context, offset) {
    context.canvas.saveLayer(
      offset & size,
      Paint()
        ..isAntiAlias = false
        ..colorFilter = leftChannelOptimizedColorFilter
        ..filterQuality = filterQuality,
    );

    super.paint(context, offset + Offset(-renderDepth, 0));
    context.canvas.restore();

    context.canvas.saveLayer(
      offset & size,
      Paint()
        ..isAntiAlias = false
        ..blendMode = blendMode
        ..color = Color.fromARGB((opacity * 255).round(), 255, 255, 255)
        ..colorFilter = rightChannelOptimizedColorFilter
        ..filterQuality = filterQuality,
    );

    super.paint(context, offset + Offset(renderDepth, 0));
    context.canvas.restore();
  }
}
