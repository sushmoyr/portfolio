import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/pages.dart';
import 'package:portfolio/ui/widgets/widgets.dart';
import 'package:portfolio/ui/components/components.dart';
import 'package:portfolio/utils/constants.dart';

class RootScreen extends StatelessWidget {
  RootScreen({Key? key}) : super(key: key);

  final List<Widget> pages = [
    WelcomePage(),
    ServicesPage(),
    AboutPage(),
  ];

  final PageController pageController =
      PageController(initialPage: 0, keepPage: false);
  final ScrollController controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var deviceType = ResponsiveWidget.of(context);
    var ratioType = ResponsiveWidget.of(context).ratioType;
    return Scaffold(
      endDrawer: (deviceType.isDesktop)
          ? null
          : Drawer(
              child: Column(
                children: [
                  placeHolder(80, 20),
                  defaultVerticalSpace,
                  placeHolder(80, 20),
                  defaultVerticalSpace,
                  placeHolder(80, 20),
                  defaultVerticalSpace,
                  placeHolder(80, 20),
                  defaultVerticalSpace,
                  placeHolder(80, 20),
                ],
              ),
            ),
      appBar: ResponsiveAppbar(
        destinations: [
          placeHolder(80, 20),
          placeHolder(80, 20),
          placeHolder(80, 20),
          placeHolder(80, 20),
          placeHolder(80, 20),
        ],
        leading: placeHolder(80, 60),
        collapsedAction: Icon(Icons.menu),
        actionItemSpacing: 16,
        onCollapsedActionClicked: () {
          _scaffoldKey.currentState!.openEndDrawer();
        },
        onActionItemClicked: (index) {
          print('Clicked $index');

          if (index < pages.length) {
            var targetOffset =
                index * ResponsiveWidget.of(context).preferredHeight;
            controller.animateTo(
              targetOffset,
              duration: Duration(seconds: 1),
              curve: Curves.decelerate,
            );
          }
        },
      ),
      body: ListView(
        children: pages,
        controller: controller,
        cacheExtent: 0,
      ),
    );
  }
}

/*PageView(
scrollDirection: Axis.vertical,
children: pages,
pageSnapping: false,
controller: pageController,
),*/
