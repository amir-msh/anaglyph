import 'package:anaglyph/anaglyph.dart';
import 'package:flutter/material.dart';

/// Checks if there's any [AnaglyphStyle] ancestor in the upper tree
bool debugCheckHasAnaglyphStyle(BuildContext context) {
  assert(() {
    if (context.findAncestorWidgetOfExactType<AnaglyphStyle>() == null) {
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary('No AnaglyphStyle widget found.'),
          ErrorDescription(
            'AnaglyphView widget require a AnaglyphStyle widget ancestor.\n',
          ),
          ErrorHint(
            'To introduce an AnaglyphStyle widget, you can use it '
            'in upper widget tree',
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
