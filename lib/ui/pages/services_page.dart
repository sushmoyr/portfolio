import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/ui/components/service_component.dart';
import 'package:portfolio/ui/widgets/widgets.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/slide_animations.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platform = ResponsiveWidget.of(context);
    var screenSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenSize.width * _getTextBoxWidthFactor(platform),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: platform.isDesktop
                      ? 60
                      : platform.isTablet
                          ? 42
                          : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'offerings to my clients'.toUpperCase(),
                    style: _getHeadlineStyle(textTheme, platform),
                  ),
                  Text(
                    welcomeDescription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          ServiceComponent(),
          SizedBox(
            height: 300,
          ),
        ],
      ),
    );
  }

  double _getTextBoxWidthFactor(ResponsiveData platform) {
    if (platform.isDesktop) {
      return 0.5;
    } else if (platform.isTablet) {
      return 0.8;
    } else {
      return 1;
    }
  }

  TextStyle _getHeadlineStyle(TextTheme theme, ResponsiveData platform) {
    if (platform.isDesktop) {
      return theme.headline4!.copyWith(color: Colors.black);
    } else if (platform.isTablet) {
      return theme.headline5!.copyWith(color: Colors.black);
    } else {
      return theme.headline6!;
    }
  }

  double _calculatePadding(BuildContext context) {
    var currentWidth = min(MediaQuery.of(context).size.width, 2400);
    var minWidth = 800;
    var diff = 1920 - minWidth;
    var ratio = 1 - (currentWidth - minWidth) / diff;
    print('ratio = $ratio');
    return max(ratio, 0.6);
  }
}
