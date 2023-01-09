import 'package:flutter/material.dart';
import 'package:anaglyph/src/anaglyph_view_style_data.dart';

class AnaglyphViewStyle extends InheritedWidget {
  final AnaglyphViewStyleData data;
  const AnaglyphViewStyle({
    super.key,
    this.data = const AnaglyphViewStyleData(),
    required super.child,
  });

  static AnaglyphViewStyle? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AnaglyphViewStyle>();
  }

  @override
  bool updateShouldNotify(AnaglyphViewStyle oldWidget) {
    return data != oldWidget.data;
  }
}
