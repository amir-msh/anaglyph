import 'package:anaglyph/anaglyph.dart';
import 'package:flutter/material.dart';

class SizedAnaglyphView extends StatelessWidget {
  final Widget child;
  final double? depth;
  static const double defaultDepth = -3;

  const SizedAnaglyphView({
    super.key,
    required this.child,
    this.depth,
  });

  @override
  Widget build(BuildContext context) {
    final depthData =
        depth ?? AnaglyphStyle.of(context)?.data.depth ?? defaultDepth;
    return AnaglyphView(
      depth: depthData,
      clipOuters: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: depthData.abs() / 2,
        ),
        child: child,
      ),
    );
  }
}
