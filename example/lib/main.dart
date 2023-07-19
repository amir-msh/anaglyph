import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anaglyph/anaglyph.dart';
import 'package:example/components/custom_scroll_behavior.dart';
import 'package:example/multi_widget.dart';
import 'package:example/components/arrow_button.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool hasNegativeDepth = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const CustomScrollBehavior(),
      title: 'َAnaglyph Example',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        primarySwatch: Colors.grey,
      ),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => setState(() => hasNegativeDepth = !hasNegativeDepth),
          child: child,
        );
      },
      home: AnimatedAnaglyphStyle(
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        data: AnaglyphStyleData(
          clipOuters: true,
          depth: (hasNegativeDepth ? -1 : 1) * 7,
        ),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  static const _pageAnimationDuration = Duration(milliseconds: 600);
  static const _pageAnimationCurve = Curves.decelerate;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.black87,
      ),
    );
    super.initState();
  }

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
              itemCount: 5,
              itemBuilder: (context, i) {
                return AnaglyphView(
                  child: Image.asset(
                    'assets/images/$i.png',
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          if (MediaQuery.of(context).size.aspectRatio > 1.2) ...[
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
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: true,
              left: true,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: AnaglyphView(
                  depth: -1,
                  clipOuters: false,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MultiWidgetExample(),
                        ),
                      );
                    },
                    child: const Text('Multi-Widget Example'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
