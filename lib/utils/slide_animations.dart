import 'package:flutter/material.dart';
import 'dart:math' as math;

extension Animation on Widget {
  Widget slideAnimation({
    SlideDirection direction = SlideDirection.fromLeft,
    Duration duration = Duration.zero,
  }) {
    return SlideAnimation(
      child: this,
      direction: direction,
      duration: duration,
    );
  }
}

enum AnimationType { slideAnimation }

enum SlideDirection {
  fromLeft,
  fromRight,
  fromTop,
  fromBottom,
  fromBottomRight,
  fromBottomLeft,
  fromTopRight,
  fromTopLeft,
}

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({
    Key? key,
    required this.child,
    required this.direction,
    required this.duration,
  }) : super(key: key);

  final Widget child;
  final SlideDirection direction;
  final Duration duration;

  @override
  _SlideAnimationState createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with TickerProviderStateMixin {
  final Tween<double> animation = Tween(begin: 1, end: 0);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TweenAnimationBuilder(
      tween: animation,
      child: widget.child,
      curve: Curves.easeInOut,
      builder: (BuildContext context, double value, Widget? child) {
        double angle = 0;
        if (widget.direction == SlideDirection.fromLeft) {
          angle = math.pi;
        }
        if (widget.direction == SlideDirection.fromRight) {
          angle = 0;
        }
        if (widget.direction == SlideDirection.fromBottom) {
          angle = math.pi / 2;
        }
        if (widget.direction == SlideDirection.fromTop) {
          angle = (3 * math.pi) / 2;
        }
        if (widget.direction == SlideDirection.fromBottomRight) {
          angle = math.pi / 4;
        }
        if (widget.direction == SlideDirection.fromBottomLeft) {
          angle = math.pi * 0.75;
        }
        if (widget.direction == SlideDirection.fromTopLeft) {
          angle = math.pi * 1.25;
        }
        if (widget.direction == SlideDirection.fromTopRight) {
          angle = math.pi * 1.75;
        }

        Offset offset = Offset.fromDirection(angle, width * value);

        return Transform.translate(
          offset: offset,
          child: Opacity(
            opacity: 1 - value,
            child: child,
          ),
        );
      },
      duration: widget.duration,
    );
  }
}
