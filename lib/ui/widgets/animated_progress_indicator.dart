import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';

class AnimatedProgressIndicator extends StatefulWidget {
  const AnimatedProgressIndicator({
    Key? key,
    required this.labelText,
    this.labelTextStyle,
    this.duration = const Duration(seconds: 2),
    required this.progress,
  }) : super(key: key);

  final String labelText;
  final TextStyle? labelTextStyle;
  final double progress;
  final Duration duration;

  @override
  _AnimatedProgressIndicatorState createState() =>
      _AnimatedProgressIndicatorState();
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late Tween<double> tween;

  @override
  void initState() {
    tween = Tween(begin: 0, end: widget.progress);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: tween,
      duration: widget.duration,
      builder: (BuildContext context, double value, Widget? child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.labelText,
                  style: widget.labelTextStyle,
                ),
                SizedBox(width: 4),
                Text(
                  '${(value * 100).toStringAsFixed(0)}%',
                  style: widget.labelTextStyle,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: CustomPaint(
                  painter: LinearProgressPainter(value),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class LinearProgressPainter extends CustomPainter {
  final double widthPercent;

  LinearProgressPainter(this.widthPercent);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = const LinearGradient(
          colors: [kDeppGradientColor, kLightGradientColor]).createShader(
        Rect.fromPoints(
          Offset.zero,
          Offset(size.width, size.height),
        ),
      )
      ..strokeWidth = size.height;
    double y = size.height / 2;

    Offset p1 = Offset(0, y);
    Offset p2 = Offset(size.width * widthPercent, y);

    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
