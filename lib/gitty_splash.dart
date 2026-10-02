import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quitter/comic_style.dart';

class GittySplashGate extends StatefulWidget {
  const GittySplashGate({super.key, required this.child});

  final Widget child;

  @override
  State<GittySplashGate> createState() => _GittySplashGateState();
}

class _GittySplashGateState extends State<GittySplashGate> {
  bool _done = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 2200), () {
      if (mounted) setState(() => _done = true);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 450),
      child: _done
          ? KeyedSubtree(key: const ValueKey('app'), child: widget.child)
          : const _GittySplash(key: ValueKey('splash')),
    );
  }
}

class _GittySplash extends StatelessWidget {
  const _GittySplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: comicYellow,
      child: Stack(
        children: [
          Positioned(
            top: -60,
            left: -40,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: comicPink,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            right: -50,
            child: Container(
              width: 240,
              height: 240,
              decoration: const BoxDecoration(
                color: comicBlue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Positioned(top: 40, right: 24, child: ComicSplat()),
          Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.8, end: 1.0),
              duration: const Duration(milliseconds: 700),
              curve: Curves.elasticOut,
              builder: (context, scale, child) =>
                  Transform.scale(scale: scale, child: child),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: comicInk, width: 4),
                        boxShadow: const [
                          BoxShadow(color: comicInk, offset: Offset(5, 5)),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/gitty/ratte.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          cacheWidth: 400,
                          errorBuilder: (context, error, stack) => const Icon(
                            Icons.pest_control_rodent,
                            size: 80,
                            color: comicInk,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    ComicPanel(
                      color: comicMint,
                      shadowColor: comicRed,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 18,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Sauber werden',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: comicInk,
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'mit Gitty',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFB3262B),
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Nüchtern betrachtet eine gute Idee.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: comicInk.withValues(alpha: 0.85),
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
