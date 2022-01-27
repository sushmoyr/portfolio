import 'package:flutter/material.dart';

class NavDestinationItem extends StatefulWidget {
  const NavDestinationItem({
    Key? key,
    this.isSelected = false,
    this.selectedColor,
    this.hoverAnimation = false,
    required this.child,
  }) : super(key: key);
  final bool isSelected;
  final Color? selectedColor;
  final bool hoverAnimation;
  final Widget child;

  @override
  State<NavDestinationItem> createState() => _NavDestinationItemState();
}

class _NavDestinationItemState extends State<NavDestinationItem> {
  double elevation = 0;
  late ValueNotifier<bool> isHovering;

  @override
  void initState() {
    isHovering = ValueNotifier(false);

    isHovering.addListener(hoverListener);

    super.initState();
  }

  @override
  void dispose() {
    isHovering.removeListener(hoverListener);
    super.dispose();
  }

  void hoverListener() {
    setState(() {
      elevation = (isHovering.value) ? 8 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MouseRegion(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            (widget.isSelected)
                ? widget.selectedColor ?? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
            BlendMode.color,
          ),
          child: widget.child,
        ),
        onEnter: (event) {
          isHovering.value = true;
        },
        onExit: (event) {
          isHovering.value = false;
        },
      ),
      elevation: elevation,
    );
  }
}
