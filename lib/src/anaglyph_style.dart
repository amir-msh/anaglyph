import 'package:flutter/material.dart';
import 'package:anaglyph/src/anaglyph_style_data.dart';

/// It sets the default style of the [AnaglyphView] widget using [InheritedWidget]
class AnaglyphStyle extends InheritedWidget {
  const AnaglyphStyle({
    super.key,
    this.data = const AnaglyphStyleData(),
    required super.child,
  });

  /// The [AnaglyphStyleData] you want to set as the default anaglyph style
  final AnaglyphStyleData data;

  static AnaglyphStyle? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AnaglyphStyle>();
  }

  @override
  bool updateShouldNotify(AnaglyphStyle oldWidget) {
    return data != oldWidget.data;
  }
}
