import 'package:flutter/material.dart';
import 'package:portfolio/ui/components/service_component.dart';
import 'package:portfolio/ui/widgets/widgets.dart';
import 'package:portfolio/utils/constants.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platform = ResponsiveWidget.of(context);
    var screenSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: platform.isMobile ? 20 : 64),
      child: SizedBox(
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
                      'offering to my clients'.toUpperCase(),
                      style: _getHeadlineStyle(textTheme, platform),
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
            const ServiceComponent(),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
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
}
