import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/pages.dart';
import 'package:portfolio/ui/widgets/widgets.dart';
import 'package:portfolio/ui/components/components.dart';
import 'package:portfolio/utils/constants.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Widget> pages = [
    WelcomePage(),
    AboutPage(),
    ServicesPage(),
    BlogPage(),
  ];

  late PageController pageController;
  int currentPage = 0;

  Widget? backToTopButton;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, keepPage: false);
    pageController.addListener(() {
      var pageOffset = pageController.page!.floor();
      if (pageOffset != currentPage) {
        setState(() {
          currentPage = pageOffset;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = ResponsiveWidget.of(context);

    List<Widget> destinations = [
      NavDestinationItem(
        child: home,
        isSelected: (currentPage == 0),
      ),
      NavDestinationItem(
        child: about,
        isSelected: (currentPage == 1),
      ),
      NavDestinationItem(
        child: services,
        isSelected: (currentPage == 2),
      ),
      NavDestinationItem(
        child: blog,
        isSelected: (currentPage == 3),
      ),
      NavDestinationItem(
        child: contact,
        isSelected: (currentPage == 4),
      ),
    ];

    return Scaffold(
      floatingActionButton: BackToTopButton(
        controller: pageController,
        onPressed: () {
          _changePage(0);
        },
      ),
      endDrawer: (deviceType.isDesktop)
          ? null
          : EndDrawer(
              destinations: destinations,
              spacing: 16,
              onDestinationClicked: _changePage,
            ),
      appBar: ResponsiveAppbar(
        destinations: destinations,
        scrollController: pageController,
        elevation: 4,
        leading: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fitHeight,
        ),
        collapsedAction: Icon(Icons.menu),
        verticalPadding: 0,
        actionItemSpacing: 16,
        onActionItemClicked: _changePage,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: pages
            .map((e) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceType.isMobile ? 20 : 64),
                  child: e,
                ))
            .toList(),
        controller: pageController,
        cacheExtent: 0,
      ),
    );
  }

  void _changePage(int page) {
    print(page);
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}
