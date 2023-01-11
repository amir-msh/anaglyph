import 'package:anaglyph/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// TODO: make it more customizable, modular and scalable

class AnaglyphView extends StatefulWidget {
  final BlendMode blendMode;
  final FilterQuality filterQuality;
  final double depth;
  final bool enabled;
  final Widget child;
  const AnaglyphView({
    super.key,
    this.blendMode = BlendMode.plus,
    this.filterQuality = FilterQuality.high,
    this.depth = kDefaultDepth,
    this.enabled = true,
    required this.child,
  });

  @override
  State<AnaglyphView> createState() => _AnaglyphViewState();
}

class _AnaglyphViewState extends State<AnaglyphView> {
  @override
  Widget build(BuildContext context) {
    // assert(debugCheckHasAnaglyphViewStyle(context));
    if (widget.enabled) {
      return _AnaglyphViewRenderObject(
        key: widget.key,
        blendMode: widget.blendMode,
        depth: widget.depth,
        filterQuality: widget.filterQuality,
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }
}

class _AnaglyphViewRenderObject extends SingleChildRenderObjectWidget {
  final BlendMode blendMode;
  final double depth;
  final FilterQuality filterQuality;

  const _AnaglyphViewRenderObject({
    required this.blendMode,
    required this.depth,
    required this.filterQuality,
    required super.child,
    required super.key,
  });

  @override
  RenderObject createRenderObject(final BuildContext context) {
    return RenderAnaglyphView(
      blendMode,
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
      ..renderDepth = depth
      ..filterQuality = filterQuality;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<BlendMode>('blendMode', blendMode))
      ..add(DoubleProperty('depth', depth))
      ..add(EnumProperty<FilterQuality>('filterQuality', filterQuality));
  }
}

class RenderAnaglyphView extends RenderProxyBox {
  BlendMode blendMode;
  double renderDepth;
  FilterQuality filterQuality;

  RenderAnaglyphView(
    this.blendMode,
    this.renderDepth,
    this.filterQuality,
  );

  @override
  void paint(context, offset) {
    final renderOffset = renderDepth.abs() + 1;

    context.canvas.saveLayer(
      offset - Offset(renderOffset, 0) & size,
      Paint()
        ..isAntiAlias = false
        ..colorFilter = leftChannelOptimizedColorFilter
        ..filterQuality = filterQuality,
    );

    super.paint(context, offset + Offset(-renderDepth, 0));
    context.canvas.restore();

    context.canvas.saveLayer(
      offset + Offset(renderOffset, 0) & size,
      Paint()
        ..isAntiAlias = false
        ..blendMode = blendMode
        ..color = Colors.white
        ..colorFilter = rightChannelOptimizedColorFilter
        ..filterQuality = filterQuality,
    );

    super.paint(context, offset + Offset(renderDepth, 0));
    context.canvas.restore();
  }
}
