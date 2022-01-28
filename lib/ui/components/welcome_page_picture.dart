import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/responsive.dart';
import 'package:portfolio/utils/constants.dart';

class WelcomePagePicture extends StatefulWidget {
  const WelcomePagePicture({Key? key}) : super(key: key);

  @override
  State<WelcomePagePicture> createState() => _WelcomePagePictureState();
}

class _WelcomePagePictureState extends State<WelcomePagePicture> {
  final Tween<double> tween = Tween(begin: 0, end: 1);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: tween,
      duration: const Duration(milliseconds: 1200),
      builder: (BuildContext context, double value, Widget? child) => Opacity(
        opacity: value,
        child: child,
      ),
      child: FractionallySizedBox(
        widthFactor: 0.8,
        heightFactor: 1,
        child: Image.asset(
          'assets/images/flutter_dev.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
