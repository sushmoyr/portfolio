import 'package:flutter/material.dart';

class BackToTopButton extends StatefulWidget {
  const BackToTopButton(
      {Key? key, required this.controller, required this.onPressed})
      : super(key: key);
  final ScrollController controller;
  final VoidCallback onPressed;

  @override
  State<BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<BackToTopButton> {
  ValueNotifier<bool> visible = ValueNotifier(false);

  @override
  void initState() {
    widget.controller.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(scrollListener);
    super.dispose();
  }

  void scrollListener() {
    if (widget.controller.offset > MediaQuery.of(context).size.height / 2) {
      visible.value = true;
    } else {
      visible.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: visible,
      builder: (BuildContext context, bool value, Widget? child) {
        if (value) {
          return child!;
        } else {
          return Container();
        }
      },
      child: Opacity(
        opacity: 0.8,
        child: FloatingActionButton(
          onPressed: widget.onPressed,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
