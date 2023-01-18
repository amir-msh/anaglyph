import 'package:anaglyph/anaglyph.dart';
import 'package:flutter/material.dart';

/// Checks if there's any [AnaglyphStyle] ancestor in the given context
bool debugCheckHasAnaglyphStyle(BuildContext context) {
  assert(() {
    if (context.findAncestorWidgetOfExactType<AnaglyphStyle>() == null) {
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary('No AnaglyphStyle widget found.'),
          ErrorHint(
            'To introduce an AnaglyphStyle widget, you can use it '
            'in the upper widget tree',
          ),
          ...context.describeMissingAncestor(
            expectedAncestorType: AnaglyphStyle,
          ),
        ],
      );
    }
    return true;
  }());
  return true;
}
