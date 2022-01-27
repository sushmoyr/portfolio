import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/linear_gradient_button.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/slide_animations.dart';

class WelcomePageSlogan extends StatelessWidget {
  const WelcomePageSlogan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                direction: SlideDirection.fromTopRight,
                duration: Duration(milliseconds: 800),
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.headline3,
              ).slideAnimation(
                direction: SlideDirection.fromRight,
                duration: Duration(milliseconds: 950),
              ),
              defaultVerticalSpace,
              Text(
                welcomeDescription,
                style: Theme.of(context).textTheme.subtitle1,
              ).slideAnimation(
                direction: SlideDirection.fromBottomRight,
                duration: Duration(milliseconds: 1100),
              ),
              defaultVerticalSpace,
              LinearGradientButton(
                onPressed: () {},
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                colors: [kDeppGradientColor, kLightGradientColor],
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
