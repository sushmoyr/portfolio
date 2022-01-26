import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';

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
              placeHolder(size.maxWidth * 0.2, 16),
              defaultVerticalSpace,
              placeHolder(size.maxWidth * 0.5, 36),
              defaultVerticalSpace,
              placeHolder(size.maxWidth * 0.8, 72),
              defaultVerticalSpace,
              placeHolder(size.maxWidth * 0.2, size.maxWidth * 0.2 * 0.4),
            ],
          ),
        ),
      );
    });
  }
}
