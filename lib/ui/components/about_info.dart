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
      return SizedBox(
        width: size.maxWidth,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Text(
                aboutMe,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              defaultVerticalSpace,
              Text(
                aboutMeDescription,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              defaultVerticalSpace,
              (cardDirection == Axis.horizontal)
                  ? _buildHorizontalCards(context)
                  : _buildVerticalCards(context),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildHorizontalCards(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InfoCard(
            description: problemSolved,
            icon: SizedBox.square(
              dimension: 60,
              child: Image.asset(
                codeIcon,
              ),
            ),
            title: totalSolves,
            isSquare: true,
            padding: const EdgeInsets.all(16),
          ).slideAnimation(
            direction: SlideDirection.fromBottom,
            duration: const Duration(milliseconds: 1000),
          ),
        ),
        Expanded(
          child: InfoCard(
            description: totalProjects,
            icon:
                SizedBox.square(dimension: 60, child: Image.asset(projectIcon)),
            title: projects,
            isSquare: true,
          ).slideAnimation(
            direction: SlideDirection.fromBottom,
            duration: const Duration(milliseconds: 1200),
          ),
        ),
        Expanded(
          child: InfoCard(
            description: githubRepository,
            icon:
                SizedBox.square(dimension: 60, child: Image.asset(githubIcon)),
            title: repository,
            isSquare: true,
          ).slideAnimation(
            direction: SlideDirection.fromBottom,
            duration: const Duration(milliseconds: 1400),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalCards(BuildContext context) {
    return Column(
      children: [
        InfoCard(
          description: problemSolved,
          crossAxisAlignment: CrossAxisAlignment.start,
          icon: SizedBox.square(
            dimension: 60,
            child: Image.asset(
              codeIcon,
            ),
          ),
          title: totalSolves,
          padding: const EdgeInsets.all(16),
        ).slideAnimation(
          direction: SlideDirection.fromLeft,
          duration: const Duration(milliseconds: 1000),
        ),
        defaultVerticalSpace,
        InfoCard(
          description: totalProjects,
          crossAxisAlignment: CrossAxisAlignment.start,
          icon: SizedBox.square(dimension: 60, child: Image.asset(projectIcon)),
          title: projects,
          padding: const EdgeInsets.all(16),
        ).slideAnimation(
          direction: SlideDirection.fromLeft,
          duration: const Duration(milliseconds: 1200),
        ),
        defaultVerticalSpace,
        InfoCard(
          description: githubRepository,
          crossAxisAlignment: CrossAxisAlignment.start,
          icon: SizedBox.square(dimension: 60, child: Image.asset(githubIcon)),
          title: repository,
          padding: const EdgeInsets.all(16),
        ).slideAnimation(
          direction: SlideDirection.fromLeft,
          duration: const Duration(milliseconds: 1400),
        )
      ],
    );
  }
}
