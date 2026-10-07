import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quitter/comic_style.dart';

/// Zeigt den Splash 3,5 Sekunden (Tipp überspringt) und blendet dann [child] ein.
/// Die Schnittstelle ist unverändert: GittySplashGate(child: ...).
class GittySplashGate extends StatefulWidget {
  const GittySplashGate({super.key, required this.child});

  final Widget child;

  @override
  State<GittySplashGate> createState() => _GittySplashGateState();
}

class _GittySplashGateState extends State<GittySplashGate> {
  static const duration = Duration(milliseconds: 3500);
  bool _done = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(duration, _finish);
  }

  void _finish() {
    if (mounted && !_done) setState(() => _done = true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: _done
          ? KeyedSubtree(key: const ValueKey('app'), child: widget.child)
          : _GittySplash(key: const ValueKey('splash'), duration: duration, onSkip: _finish),
    );
  }
}

class _GittySplash extends StatefulWidget {
  const _GittySplash({super.key, required this.duration, required this.onSkip});

  final Duration duration;
  final VoidCallback onSkip;

  @override
  State<_GittySplash> createState() => _GittySplashState();
}

class _GittySplashState extends State<_GittySplash> with TickerProviderStateMixin {
  late final AnimationController _blob =
      AnimationController(vsync: this, duration: const Duration(seconds: 6))..repeat();
  late final AnimationController _intro =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1400))..forward();


  @override
  void dispose() {
    _blob.dispose();
    _intro.dispose();
    super.dispose();
  }

  Animation<double> _step(double a, double b, [Curve c = Curves.easeOutBack]) =>
      CurvedAnimation(parent: _intro, curve: Interval(a, b, curve: c));

  @override
  Widget build(BuildContext context) {
    final logo = _step(0.0, 0.55);
    final title1 = _step(0.25, 0.75, Curves.easeOutCubic);
    final title2 = _step(0.40, 0.90);
    final sub = _step(0.65, 1.0, Curves.easeOut);

    final big = GoogleFonts.lilitaOne(color: comicInk, fontSize: 44, height: 1.0);
    final accent = GoogleFonts.lilitaOne(color: const Color(0xFFB3262B), fontSize: 60, height: 1.0);
    final small = GoogleFonts.caveatBrush(color: comicInk, fontSize: 24);

    return Material(
      color: comicYellow,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onSkip,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedBuilder(
              animation: _blob,
              builder: (_, __) => CustomPaint(painter: _BlobsPainter(_blob.value)),
            ),
            SafeArea(
              child: Column(
                children: [
                  const Spacer(flex: 3),
                  ScaleTransition(
                    scale: logo,
                    child: AnimatedBuilder(
                      animation: _blob,
                      builder: (_, child) => Transform.rotate(
                        angle: math.sin(_blob.value * 2 * math.pi) * 0.04,
                        child: child,
                      ),
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: comicInk, width: 4),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(95),
                            topRight: Radius.circular(80),
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(100),
                          ),
                          boxShadow: const [BoxShadow(color: comicRed, offset: Offset(6, 8))],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          'assets/gitty/ratte_gitty_m.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          cacheWidth: 500,
                          errorBuilder: (context, error, stack) => const Icon(
                            Icons.pest_control_rodent,
                            size: 80,
                            color: comicInk,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  FadeTransition(
                    opacity: title1,
                    child: SlideTransition(
                      position: Tween(begin: const Offset(-0.3, 0), end: Offset.zero).animate(title1),
                      child: Transform.rotate(angle: -0.03, child: Text('Quitty', style: big)),
                    ),
                  ),
                  FadeTransition(
                    opacity: title2,
                    child: ScaleTransition(
                      scale: Tween(begin: 0.6, end: 1.0).animate(title2),
                      child: Transform.rotate(angle: 0.025, child: Text('mit Gitty', style: accent)),
                    ),
                  ),
                  const SizedBox(height: 14),
                  FadeTransition(
                    opacity: sub,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Nüchtern betrachtet eine gute Idee.',
                        textAlign: TextAlign.center,
                        style: small,
                      ),
                    ),
                  ),
                  const Spacer(flex: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Weiche, langsam atmende Blobs statt harter Kreise.
class _BlobsPainter extends CustomPainter {
  _BlobsPainter(this.t);
  final double t;

  Path _blob(Offset c, double r, double phase, {int n = 7}) {
    final pts = <Offset>[];
    for (var i = 0; i < n; i++) {
      final a = 2 * math.pi * i / n;
      final wob = 1 + 0.16 * math.sin(2 * math.pi * t + phase + i * 1.7);
      pts.add(c + Offset(math.cos(a), math.sin(a)) * r * wob);
    }
    final mid = [for (var i = 0; i < n; i++) Offset.lerp(pts[i], pts[(i + 1) % n], 0.5)!];
    final path = Path()..moveTo(mid[n - 1].dx, mid[n - 1].dy);
    for (var i = 0; i < n; i++) {
      path.quadraticBezierTo(pts[i].dx, pts[i].dy, mid[i].dx, mid[i].dy);
    }
    return path..close();
  }

  @override
  void paint(Canvas canvas, Size s) {
    void draw(Offset c, double r, double ph, Color col) {
      canvas.drawPath(_blob(c, r, ph), Paint()..color = col);
    }

    draw(Offset(s.width * 0.08, s.height * 0.06), s.width * 0.42, 0.0, comicPink);
    draw(Offset(s.width * 0.95, s.height * 0.95), s.width * 0.48, 2.0, comicBlue);
    draw(Offset(s.width * 0.90, s.height * 0.22), s.width * 0.11, 4.0, comicRed);
    draw(Offset(s.width * 0.12, s.height * 0.78), s.width * 0.14, 1.0, comicMint);
    draw(Offset(s.width * 0.80, s.height * 0.58), s.width * 0.05, 3.0, Colors.white);
  }

  @override
  bool shouldRepaint(_BlobsPainter old) => old.t != t;
}
