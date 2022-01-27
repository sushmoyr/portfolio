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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Column(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              (widget.isSelected)
                  ? widget.selectedColor ?? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
              BlendMode.srcATop,
            ),
            child: widget.child,
          ),
          (isHovering.value || widget.isSelected)
              ? Container(
                  height: 1,
                  width: 16,
                  color: (widget.isSelected)
                      ? (widget.selectedColor ?? Theme.of(context).primaryColor)
                      : Theme.of(context).disabledColor,
                )
              : Container(),
        ],
      ),
      onEnter: (event) {
        isHovering.value = true;
      },
      onExit: (event) {
        isHovering.value = false;
      },
    );
  }
}
