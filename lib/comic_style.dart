import 'package:flutter/material.dart';

const comicInk = Color(0xFF16161D);
const comicRed = Color(0xFFE5484D);
const comicMint = Color(0xFFB8F0D0);
const comicPink = Color(0xFFFFC2D9);
const comicYellow = Color(0xFFFFE680);
const comicBlue = Color(0xFFB9D7FF);

class ComicPanel extends StatelessWidget {
  const ComicPanel({
    super.key,
    required this.child,
    this.color = comicMint,
    this.shadowColor = comicRed,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.splat = false,
  });

  final Widget child;
  final Color color;
  final Color shadowColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool splat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: comicInk, width: 3),
          boxShadow: [
            BoxShadow(color: shadowColor, offset: const Offset(5, 5)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(19),
          child: Stack(
            children: [
              if (splat)
                const Positioned(
                  top: -8,
                  right: -8,
                  child: IgnorePointer(child: ComicSplat()),
                ),
              Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: onTap,
                  child: Padding(padding: padding, child: child),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComicSplat extends StatelessWidget {
  const ComicSplat({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 60,
      height: 60,
      child: CustomPaint(painter: _SplatPainter()),
    );
  }
}

class _SplatPainter extends CustomPainter {
  const _SplatPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = comicRed.withAlpha(235);
    canvas.drawCircle(const Offset(32, 28), 17, paint);
    canvas.drawCircle(const Offset(12, 44), 6, paint);
    canvas.drawCircle(const Offset(47, 8), 5, paint);
    canvas.drawCircle(const Offset(8, 18), 4, paint);
    canvas.drawCircle(const Offset(52, 48), 7, paint);
    canvas.drawCircle(const Offset(24, 54), 3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ComicBubble extends StatelessWidget {
  const ComicBubble({super.key, required this.child, this.color = Colors.white});

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: comicInk, width: 2.5),
            ),
            child: child,
          ),
          Positioned(
            top: -9.5,
            left: 22,
            child: CustomPaint(
              size: const Size(20, 11),
              painter: _TailPainter(color),
            ),
          ),
        ],
      ),
    );
  }
}

class _TailPainter extends CustomPainter {
  const _TailPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.35, 0)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
    final stroke = Paint()
      ..color = comicInk
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeJoin = StrokeJoin.round;
    final lines = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.35, 0)
      ..lineTo(size.width, size.height);
    canvas.drawPath(lines, stroke);
  }

  @override
  bool shouldRepaint(covariant _TailPainter oldDelegate) =>
      oldDelegate.color != color;
}
