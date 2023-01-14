import 'package:anaglyph/anaglyph.dart';
import 'package:flutter/material.dart';

/// Checks if there's any [AnaglyphViewStyle] ancestor above or not
bool debugCheckHasAnaglyphViewStyle(BuildContext context) {
  assert(() {
    if (context.findAncestorWidgetOfExactType<AnaglyphViewStyle>() == null) {
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary('No AnaglyphViewStyle widget found.'),
          ErrorDescription(
            'AnaglyphView widget require a AnaglyphViewStyle widget ancestor.\n',
          ),
          ErrorHint(
            'To introduce an AnaglyphViewStyle widget, you can use it '
            'in upper widget tree',
          ),
          ...context.describeMissingAncestor(
            expectedAncestorType: AnaglyphViewStyle,
          ),
        ],
      );
    }
    return true;
  }());
  return true;
}
