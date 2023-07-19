import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anaglyph/anaglyph.dart';
import 'package:example/components/sized_anaglyph_view.dart';

class MultiWidgetExample extends StatefulWidget {
  const MultiWidgetExample({super.key});

  @override
  State<MultiWidgetExample> createState() => _MultiWidgetExampleState();
}

class _MultiWidgetExampleState extends State<MultiWidgetExample>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  CurvedAnimation? _curvedAnimation;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
    );

    _controller?.value = 1;

    Future.delayed(
      const Duration(milliseconds: 600),
      () => _controller?.repeat(reverse: true),
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    );

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    _controller?.dispose();
    _curvedAnimation?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) {
                return ScaleTransition(
                  scale: Tween<double>(
                    begin: 1,
                    end: 1.12,
                  ).animate(_curvedAnimation!),
                  child: child!,
                );
              },
              child: AnaglyphView(
                depth: 3.2,
                clipOuters: false,
                child: Image.asset(
                  'assets/images/photo-1506318137071-a8e063b4bec0.avif',
                  // Source: 'https://images.unsplash.com/photo-1506318137071-a8e063b4bec0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2093&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0.8, -0.9),
            padding: const EdgeInsets.all(25),
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.1, 0.1),
                    end: const Offset(-0.15, 0.45),
                  ).animate(_curvedAnimation!),
                  child: ScaleTransition(
                    scale: Tween<double>(
                      begin: 0.9,
                      end: 1.0,
                    ).animate(_curvedAnimation!),
                    child: AnaglyphView(
                      clipOuters: false,
                      depth: Tween<double>(
                        begin: 2,
                        end: -2,
                      ).animate(_curvedAnimation!).value,
                      child: child!,
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/comet.png',
                isAntiAlias: true,
                fit: BoxFit.scaleDown,
                width: clampDouble(
                  MediaQuery.of(context).size.width / 10,
                  78,
                  140,
                ),
              ),
            ),
          ),
          Container(
            alignment: const Alignment(-0.82, -0.75),
            padding: const EdgeInsets.all(50),
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.015, 0),
                    end: const Offset(-0.01, -0.2),
                  ).animate(_curvedAnimation!),
                  child: RotationTransition(
                    turns: Tween<double>(
                      begin: 0.07,
                      end: -0.00,
                    ).animate(_curvedAnimation!),
                    child: ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.98,
                        end: 1.12,
                      ).animate(_curvedAnimation!),
                      child: AnaglyphView(
                        clipOuters: false,
                        depth: Tween<double>(
                          begin: 3,
                          end: 0,
                        ).animate(_curvedAnimation!).value,
                        child: child!,
                      ),
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/1-tb.png',
                isAntiAlias: true,
                fit: BoxFit.scaleDown,
                color: Colors.white.withOpacity(0.85),
                colorBlendMode: BlendMode.modulate,
                width: clampDouble(
                  MediaQuery.of(context).size.width / 7,
                  100,
                  210,
                ),
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.01),
            padding: const EdgeInsets.all(33),
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0),
                    end: const Offset(0, 0.12),
                  ).animate(_curvedAnimation!),
                  child: RotationTransition(
                    turns: Tween<double>(
                      begin: -0.007,
                      end: 0.007,
                    ).animate(_curvedAnimation!),
                    child: child,
                  ),
                );
              },
              child: AnaglyphView(
                depth: -2,
                clipOuters: false,
                child: Image.asset(
                  'assets/images/0-tb.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              top: true,
              left: true,
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: -100, end: 0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.ease,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(value, 0),
                    child: child!,
                  );
                },
                child: SizedAnaglyphView(
                  depth: -1.6,
                  child: Material(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(30),
                    clipBehavior: Clip.antiAlias,
                    child: IconButton(
                      color: Colors.black87,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
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
