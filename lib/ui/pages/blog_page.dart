import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Blogs',
            style: Theme.of(context).textTheme.headline4,
          ),
          Spacer(),
          InfinityAnimation(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: kLightGradientColor),
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'In Development',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: kDeppGradientColor),
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}

class InfinityAnimation extends StatefulWidget {
  const InfinityAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  State<InfinityAnimation> createState() => _InfinityAnimationState();
}

class _InfinityAnimationState extends State<InfinityAnimation>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    //controller.addStatusListener(statusListener);
    controller.forward();
    controller.repeat(
      reverse: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.removeStatusListener(statusListener);
    controller.dispose();
    super.dispose();
  }

  void statusListener(AnimationStatus status) async {
    if (status == AnimationStatus.completed) {
      Timer(Duration(seconds: 3), () {
        controller.reverse();
      });
    }
    if (status == AnimationStatus.dismissed) {
      Timer(Duration(seconds: 1), () {
        controller.forward();
      });
    }
  }

  Future<void> delay() async {
    Timer(Duration(seconds: 2), () {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: (animation.value < 0.5) ? 0 : animation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class CircleOutlinePainter extends CustomPainter {
  final double startAngle;

  CircleOutlinePainter(this.startAngle);
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..shader = SweepGradient(
        colors: [kLightGradientColor, kDeppGradientColor],
        startAngle: startAngle,
        endAngle: startAngle + (2 * pi),
      ).createShader(Rect.fromCenter(
          center: center, width: size.width, height: size.height))
      ..strokeWidth = 8;

    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        startAngle,
        pi * 1.5,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
