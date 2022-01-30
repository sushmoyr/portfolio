import 'package:flutter/material.dart';
import 'package:portfolio/utils/slide_animations.dart';

class TileCard extends StatefulWidget {
  const TileCard(
      {Key? key,
      this.borderRadius = 4,
      this.currentElevation = 0,
      this.hoverElevation = 4,
      required this.icon,
      required this.title,
      required this.description,
      this.contentPadding = const EdgeInsets.all(0),
      this.animationDuration = Duration.zero,
      this.animationDirection = SlideDirection.fromBottom})
      : super(key: key);

  final double currentElevation;
  final double hoverElevation;
  final double borderRadius;
  final Widget icon;
  final Widget title;
  final Widget description;
  final EdgeInsets contentPadding;
  final SlideDirection animationDirection;
  final Duration animationDuration;

  @override
  _TileCardState createState() => _TileCardState();
}

class _TileCardState extends State<TileCard> {
  late double elevation;
  late double borderWidth;

  @override
  void initState() {
    elevation = widget.currentElevation;
    borderWidth = 1;
    super.initState();
  }

  void _hoverEnter(PointerEvent event) {
    setState(() {
      elevation = widget.hoverElevation;
      borderWidth = 0;
    });
  }

  void _hoverExit(PointerEvent event) {
    setState(() {
      elevation = widget.currentElevation;
      borderWidth = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, size) => SizedBox(
          width: size.maxWidth,
          height: size.maxWidth,
          child: MouseRegion(
            onEnter: _hoverEnter,
            onExit: _hoverExit,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              elevation: elevation,
              child: Padding(
                padding: widget.contentPadding,
                child: Column(
                  children: [
                    Expanded(
                      child: widget.icon,
                    ),
                    widget.title,
                    Expanded(child: widget.description)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ).slideAnimation(
        duration: widget.animationDuration,
        direction: widget.animationDirection);
  }
}
