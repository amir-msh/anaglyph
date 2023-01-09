import 'dart:io';
import 'package:example/components/arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:anaglyph/anaglyph.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 6,
              itemBuilder: (context, i) => Image.asset(
                'assets/images/$i.png',
                fit: BoxFit.contain,
                frameBuilder: (_, child, __, ___) {
                  return AnaglyphView(child: child);
                },
              ),
            ),
          ),
          if (!Platform.isAndroid && !Platform.isIOS) ...[
            ArrowButton(
              direction: ArrowDirection.left,
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
            ArrowButton(
              direction: ArrowDirection.right,
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
