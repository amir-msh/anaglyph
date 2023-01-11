import 'package:anaglyph/anaglyph.dart';
import 'package:flutter/material.dart';

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
