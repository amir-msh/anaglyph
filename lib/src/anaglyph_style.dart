import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:anaglyph/src/anaglyph_style_data.dart';

/// It sets the default style of the [AnaglyphView] widgets using [InheritedWidget].
class AnaglyphStyle extends InheritedWidget {
  /// `data` will be set as the default anaglyph style.
  const AnaglyphStyle({
    super.key,
    this.data = const AnaglyphStyleData(),
    required super.child,
  });

  /// The [AnaglyphStyleData] you want to set as the default anaglyph style.
  final AnaglyphStyleData data;

  /// The state from the closest instance of this class that encloses the given context.
  static AnaglyphStyle? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AnaglyphStyle>();
  }

  @override
  bool updateShouldNotify(AnaglyphStyle oldWidget) {
    return data != oldWidget.data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AnaglyphStyleData>('data', data));
  }
}
