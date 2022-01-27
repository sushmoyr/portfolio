import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/info_card.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/slide_animations.dart';

class AboutInfo extends StatelessWidget {
  const AboutInfo({
    Key? key,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.cardDirection = Axis.horizontal,
  }) : super(key: key);

  final CrossAxisAlignment crossAxisAlignment;
  final Axis cardDirection;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, size) {
      print('Layout builder height = ${size.maxHeight}');
      return SizedBox(
        width: size.maxWidth,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              placeHolder(200, 50),
              defaultVerticalSpace,
              placeHolder(size.maxWidth, 150),
              (cardDirection == Axis.horizontal)
                  ? _buildHorizontalCards()
                  : Container(),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildHorizontalCards() {
    return Row(
      children: [
        Expanded(
          child: InfoCard(
            description: Container(),
            icon: Container(),
            title: Container(),
            isSquare: true,
          ).slideAnimation(
            direction: SlideDirection.fromBottom,
            duration: Duration(milliseconds: 1000),
          ),
        ),
        SizedBox(width: 36),
        Expanded(
          child: InfoCard(
            description: Container(),
            icon: Container(),
            title: Container(),
            isSquare: true,
          ).slideAnimation(
            direction: SlideDirection.fromBottom,
            duration: Duration(milliseconds: 1200),
          ),
        ),
        SizedBox(width: 36),
        Expanded(
          child: InfoCard(
            description: Container(),
            icon: Container(),
            title: Container(),
            isSquare: true,
          ).slideAnimation(
            direction: SlideDirection.fromBottom,
            duration: Duration(milliseconds: 1400),
          ),
        ),
      ],
    );
  }
}
