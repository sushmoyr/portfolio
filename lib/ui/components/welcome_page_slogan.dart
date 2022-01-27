import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/linear_gradient_button.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/slide_animations.dart';

class WelcomePageSlogan extends StatelessWidget {
  const WelcomePageSlogan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var animationDuration = const Duration(milliseconds: 1200);
    return LayoutBuilder(builder: (context, size) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                welcomeCaption,
                style: Theme.of(context).textTheme.headline6,
              ).slideAnimation(
                direction: SlideDirection.fromTop,
                duration: animationDuration,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.headline3,
              ).slideAnimation(
                direction: SlideDirection.fromTopRight,
                duration: animationDuration,
              ),
              defaultVerticalSpace,
              Text(
                welcomeDescription,
                style: Theme.of(context).textTheme.subtitle1,
              ).slideAnimation(
                direction: SlideDirection.fromRight,
                duration: animationDuration,
              ),
              defaultVerticalSpace,
              LinearGradientButton(
                onPressed: () {},
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                colors: const [kDeppGradientColor, kLightGradientColor],
                child: Text(
                  hireMe,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
                borderRadius: BorderRadius.circular(8),
                elevation: 4,
              ),
            ],
          ),
        ),
      );
    });
  }
}
