import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/animated_progress_indicator.dart';
import 'package:portfolio/utils/constants.dart';

class SkillInfo extends StatelessWidget {
  const SkillInfo({Key? key, this.elevation = 12.0}) : super(key: key);

  final double elevation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, size) {
      return SizedBox(
        width: size.maxWidth,
        child: Card(
          elevation: elevation,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'TOOLS EXPERTNESS',
                  style: Theme.of(context).textTheme.headline6,
                ),
                defaultVerticalSpace,
                AnimatedProgressIndicator(
                  labelText: 'Hello',
                  progress: 0.7,
                ),
                AnimatedProgressIndicator(
                  labelText: 'Hello',
                  progress: 0.3,
                ),
                AnimatedProgressIndicator(
                  labelText: 'Hello',
                  progress: 1,
                ),
                AnimatedProgressIndicator(
                  labelText: 'Hello',
                  progress: 0.5,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
