import 'package:flutter/material.dart';
import 'package:portfolio/ui/components/about_info.dart';
import 'package:portfolio/ui/components/components.dart';
import 'package:portfolio/ui/widgets/widgets.dart';
import 'package:portfolio/utils/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = ResponsiveWidget.of(context);
    print('About page');
    return Container(
      width: MediaQuery.of(context).size.width,
      height: (responsive.isDesktop)
          ? responsive.preferredHeight - kToolbarHeight
          : null,
      color: Colors.blue,
      child: RowColumn(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        axis: (responsive.isDesktop) ? Axis.horizontal : Axis.vertical,
        children: (responsive.isDesktop)
            ? _buildDesktopChildren(context)
            : _buildOtherChildren(context),
      ),
    );
  }

  _buildDesktopChildren(BuildContext context) {
    return [
      Expanded(
        flex: 1,
        child: _getAboutInfo(),
      ),
      Expanded(
        flex: 1,
        child: _getSkillInfo(),
      ),
    ];
  }

  _buildOtherChildren(BuildContext context) {
    return [
      _getAboutInfo(),
      defaultVerticalSpace,
      _getSkillInfo(),
    ];
  }

  Widget _getAboutInfo() {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: AboutInfo(),
    );
  }

  Widget _getSkillInfo() {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: SkillInfo(),
    );
  }
}
