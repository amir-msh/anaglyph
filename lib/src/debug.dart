import 'package:flutter/material.dart';

bool debugCheckHasAnaglyphTheme(BuildContext context) {
  assert(() {
    if (context.widget is! Material &&
        context.findAncestorWidgetOfExactType<Material>() == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('No Material widget found.'),
        ErrorDescription(
          '${context.widget.runtimeType} widgets require a Material '
          'widget ancestor.\n'
          'In Material Design, most widgets are conceptually "printed" on '
          "a sheet of material. In Flutter's material library, that "
          'material is represented by the Material widget. It is the '
          'Material widget that renders ink splashes, for instance. '
          'Because of this, many material library widgets require that '
          'there be a Material widget in the tree above them.',
        ),
        ErrorHint(
          'To introduce a Material widget, you can either directly '
          'include one, or use a widget that contains Material itself, '
          'such as a Card, Dialog, Drawer, or Scaffold.',
        ),
        ...context.describeMissingAncestor(expectedAncestorType: Material),
      ]);
    }
    return true;
  }());
  return true;
}
