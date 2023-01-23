import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:anaglyph/anaglyph.dart';

void main() {
  testWidgets(
    'Anaglyph effect for a text widget',
    (WidgetTester tester) async {
      final anaglyphKey = UniqueKey();
      final textKey = UniqueKey();
      await tester.pumpWidget(
        MaterialApp(
          home: AnaglyphStyle(
            data: const AnaglyphStyleData(),
            child: Scaffold(
              body: Center(
                child: Builder(
                  builder: (context) {
                    return AnaglyphView(
                      key: anaglyphKey,
                      clipOuters: false,
                      child: Text(
                        '3D TEXT',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                        key: textKey,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
      expect(find.byKey(anaglyphKey), findsOneWidget);
      expect(find.byKey(textKey), isOnstage);
    },
  );
}
