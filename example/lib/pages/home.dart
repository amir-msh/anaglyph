import 'package:example/components/arrow_button.dart';
import 'package:example/utils/getters.dart';
import 'package:flutter/material.dart';
import 'package:anaglyph/anaglyph.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  static const _pageAnimationDuration = Duration(milliseconds: 666);
  static const _pageAnimationCurve = Curves.decelerate;

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
              itemBuilder: (context, i) => FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  'assets/images/$i.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  frameBuilder: (_, child, __, ___) {
                    return AnaglyphView(
                      child: child,
                    );
                  },
                ),
              ),
            ),
          ),
          if (isDesktop) ...[
            ArrowButton(
              direction: ArrowDirection.left,
              onPressed: () {
                _pageController.previousPage(
                  duration: _pageAnimationDuration,
                  curve: _pageAnimationCurve,
                );
              },
            ),
            ArrowButton(
              direction: ArrowDirection.right,
              onPressed: () {
                _pageController.nextPage(
                  duration: _pageAnimationDuration,
                  curve: _pageAnimationCurve,
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
