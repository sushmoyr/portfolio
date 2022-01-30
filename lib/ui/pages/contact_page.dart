import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/widgets.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/social_icons_icons.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  final EdgeInsets _iconButtonPadding = const EdgeInsets.all(16);

  @override
  Widget build(BuildContext context) {
    var platform = ResponsiveWidget.of(context);
    return Container(
      color: kDeepBlueColor,
      padding: EdgeInsets.symmetric(vertical: platform.isDesktop ? 60 : 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Follow Me',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white),
          ),
          defaultVerticalSpace,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                padding: _iconButtonPadding,
                icon: const Icon(
                  SocialIcons.facebook,
                  color: Colors.white,
                ),
                tooltip: 'Facebook',
              ),
              IconButton(
                onPressed: () {},
                padding: _iconButtonPadding,
                icon: const Icon(
                  SocialIcons.instagram,
                  color: Colors.white,
                ),
                tooltip: 'Instagram',
              ),
              IconButton(
                onPressed: () {},
                padding: _iconButtonPadding,
                icon: const Icon(
                  SocialIcons.linkedin,
                  color: Colors.white,
                ),
                tooltip: 'Linkedin',
              ),
            ],
          )
        ],
      ),
    );
  }
}
