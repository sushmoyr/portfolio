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
          if (currentPage != 0) {
            print('set top button');
            backToTopButton = FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.arrow_upward),
            );
          } else {
            backToTopButton = null;
            print('unset top button');
          }
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
    var ratioType = ResponsiveWidget.of(context).ratioType;

    List<Widget> destinations = [
      NavDestinationItem(
        child: placeHolder(80, 20),
        isSelected: (currentPage == 0),
      ),
      NavDestinationItem(
        child: placeHolder(80, 20),
        isSelected: (currentPage == 1),
      ),
      NavDestinationItem(
        child: placeHolder(80, 20),
        isSelected: (currentPage == 2),
      ),
      NavDestinationItem(
        child: placeHolder(80, 20),
        isSelected: (currentPage == 3),
      ),
      NavDestinationItem(
        child: placeHolder(80, 20),
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
        leading: placeHolder(80, 60),
        collapsedAction: Icon(Icons.menu),
        actionItemSpacing: 16,
        onActionItemClicked: _changePage,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: pages,
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

class BackToTopButton extends StatefulWidget {
  const BackToTopButton(
      {Key? key, required this.controller, required this.onPressed})
      : super(key: key);
  final ScrollController controller;
  final VoidCallback onPressed;

  @override
  State<BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<BackToTopButton> {
  ValueNotifier<bool> visible = ValueNotifier(false);

  @override
  void initState() {
    widget.controller.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(scrollListener);
    super.dispose();
  }

  void scrollListener() {
    if (widget.controller.offset > MediaQuery.of(context).size.height / 2) {
      visible.value = true;
    } else {
      visible.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: visible,
      builder: (BuildContext context, bool value, Widget? child) {
        if (value) {
          return child!;
        } else {
          return Container();
        }
      },
      child: Opacity(
        opacity: 0.8,
        child: FloatingActionButton(
          onPressed: widget.onPressed,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
