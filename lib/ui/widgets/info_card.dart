import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.isSquare = true,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  final EdgeInsets padding;
  final bool isSquare;
  final Widget icon;
  final Widget title;
  final Widget description;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, size) {
        return Container(
          width: (isSquare) ? size.maxWidth : double.infinity,
          height: (isSquare) ? size.maxWidth : null,
          padding: padding,
          color: Colors.blueGrey,
        );
      },
    );
  }
}
