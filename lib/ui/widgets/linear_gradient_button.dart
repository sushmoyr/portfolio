import 'package:flutter/material.dart';

class LinearGradientButton extends StatelessWidget {
  const LinearGradientButton({
    Key? key,
    required this.colors,
    required this.child,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.stops,
    this.tileMode = TileMode.clamp,
    this.transform,
    this.borderRadius,
    this.border,
    this.width,
    this.height,
    this.contentPadding,
    this.onPressed,
    this.elevation = 0,
  }) : super(key: key);

  final List<Color> colors;
  final Widget child;

  //Linear Gradient Settings
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double>? stops;
  final TileMode tileMode;
  final GradientTransform? transform;

  //Container Settings
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;

  //Material Button Settings
  final VoidCallback? onPressed;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors,
          stops: stops,
          tileMode: tileMode,
          transform: transform,
        ),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: contentPadding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}

/*
 */
