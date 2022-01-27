import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/animated_progress_indicator.dart';
import 'package:portfolio/utils/constants.dart';

class SkillInfo extends StatelessWidget {
  const SkillInfo({Key? key, this.elevation = 12.0}) : super(key: key);

  final double elevation;

  @override
  Widget build(BuildContext context) {
    TextStyle indicatorTextStyle = Theme.of(context).textTheme.subtitle1!;
    Widget gap = SizedBox(height: 16);
    return LayoutBuilder(builder: (ctx, size) {
      return SizedBox(
        width: size.maxWidth,
        child: Card(
          elevation: elevation,
          margin: const EdgeInsets.symmetric(vertical: 36),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'LANGUAGES',
                  style: Theme.of(context).textTheme.headline6,
                ),
                defaultVerticalSpace,
                AnimatedProgressIndicator(
                  labelText: kotlin,
                  progress: 0.8,
                  labelTextStyle: indicatorTextStyle,
                ),
                gap,
                AnimatedProgressIndicator(
                  labelText: dart,
                  progress: 0.7,
                  labelTextStyle: indicatorTextStyle,
                ),
                gap,
                AnimatedProgressIndicator(
                  labelText: java,
                  progress: 0.5,
                  labelTextStyle: indicatorTextStyle,
                ),
                gap,
                AnimatedProgressIndicator(
                  labelText: cpp,
                  progress: 0.7,
                  labelTextStyle: indicatorTextStyle,
                ),
                gap,
                AnimatedProgressIndicator(
                  labelText: javascript,
                  progress: 0.4,
                  labelTextStyle: indicatorTextStyle,
                ),
                gap,
              ],
            ),
          ),
        ),
      );
    });
  }
}
