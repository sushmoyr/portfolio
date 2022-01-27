import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.isSquare = false,
    this.elevation = 0,
    required this.icon,
    required this.title,
    required this.description,
    this.spacing = 0,
  }) : super(key: key);

  final EdgeInsets padding;
  final bool isSquare;
  final Widget icon;
  final String title;
  final String description;
  final double elevation;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, size) {
        return SizedBox(
          width: (isSquare) ? size.maxWidth : double.infinity,
          height: (isSquare) ? size.maxWidth : null,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: padding,
              child: (isSquare)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon,
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    )
                  : Wrap(
                      spacing: spacing,
                      direction: Axis.vertical,
                      children: [
                        icon,
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
            ),
            elevation: elevation,
          ),
        );
      },
    );
  }
}
