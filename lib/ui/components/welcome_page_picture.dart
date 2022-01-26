import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/responsive.dart';
import 'package:portfolio/utils/constants.dart';

class WelcomePagePicture extends StatelessWidget {
  const WelcomePagePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.8,
      child: Container(
        color: kPlaceHolderColor,
      ),
    );
  }
}
