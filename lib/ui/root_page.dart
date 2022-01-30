import 'package:flutter/material.dart';
import 'package:portfolio/ui/pages/pages.dart';
import 'package:portfolio/ui/widgets/widgets.dart';
import 'package:portfolio/ui/components/components.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> pages;

  late ItemScrollController _itemScrollController;
  late ItemPositionsListener _itemPositionsListener;

  late ValueNotifier<int> currentPage;

  @override
  void initState() {
    pages = const [
      WelcomePage(),
      AboutPage(),
      ServicesPage(),
      ContactPage(),
    ];

    currentPage = ValueNotifier(0);
    _itemScrollController = ItemScrollController();
    _itemPositionsListener = ItemPositionsListener.create();

    _itemPositionsListener.itemPositions.addListener(_positionListener);

    super.initState();
  }

  void _positionListener() {
    var position = _itemPositionsListener.itemPositions.value;
    currentPage.value = position.first.index;
  }

  void _jumpToSection(int index) {
    currentPage.value = index;
    _itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = ResponsiveWidget.of(context);

    return ValueListenableBuilder<int>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          endDrawer: (deviceType.isDesktop)
              ? null
              : EndDrawer(
                  destinations: _getDestination(value),
                  spacing: 16,
                  onDestinationClicked: _jumpToSection,
                ),
          appBar: ResponsiveAppbar(
            destinations: _getDestination(value),
            elevation: 4,
            leading: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitHeight,
            ),
            collapsedAction: const Icon(Icons.menu),
            verticalPadding: 0,
            actionItemSpacing: 16,
            onActionItemClicked: _jumpToSection,
          ),
          body: ScrollablePositionedList.builder(
            itemCount: pages.length,
            itemBuilder: (context, index) => pages[index],
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionsListener,
          ),
        );
      },
      valueListenable: currentPage,
    );
  }

  static List<Widget> _getDestination(int selected) => [
        NavDestinationItem(
          child: home,
          isSelected: (selected == 0),
        ),
        NavDestinationItem(
          child: about,
          isSelected: (selected == 1),
        ),
        NavDestinationItem(
          child: services,
          isSelected: (selected == 2),
        ),
        NavDestinationItem(
          child: contact,
          isSelected: (selected == 4),
        ),
      ];
}
