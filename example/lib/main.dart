import 'package:anaglyph/anaglyph.dart';
import 'package:example/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'َAnaglyph Example',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        primarySwatch: Colors.grey,
      ),
      home: const AnimatedAnaglyphStyle(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeOutCubic,
        data: AnaglyphStyleData(
          depth: -5,
          stereoPairStyle: AnaglyphStereoPairStyle.optimizedColor(),
          clipOuters: true,
        ),
        child: HomePage(),
      ),
    );
  }
}
