import 'package:flutter/material.dart';

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
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.alignment,
    this.borderRadius = 8,
  }) : super(key: key);

  final EdgeInsets padding;
  final bool isSquare;
  final Widget icon;
  final String title;
  final String description;
  final double elevation;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final WrapAlignment? alignment;
  final double borderRadius;

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
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Padding(
              padding: padding,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: (isSquare) ? Alignment.center : Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    icon,
                    SizedBox(
                      height: spacing,
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: spacing,
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
            elevation: elevation,
          ),
        );
      },
    );
  }

  /*Widget _buildCard(BuildContext context) => ;*/
}

/*

Card(
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
                        AutoReSizeText(
                          title,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline6!,
                        ),
                        SizedBox(
                          width: size.maxWidth,
                          child: FittedBox(
                            child: Text(
                              description,
                              style: Theme.of(context).textTheme.subtitle1!,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Wrap(
                      spacing: spacing,
                      direction: Axis.vertical,
                      children: [
                        icon,
                        AutoReSizeText(
                          title,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline6!,
                        ),
                        AutoReSizeText(
                          description,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.subtitle1!,
                        ),
                      ],
                    ),
            ),
            elevation: elevation,
          )
 */
