import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/widgets.dart';
import 'package:portfolio/ui/components/components.dart';
import 'package:portfolio/utils/constants.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceType = ResponsiveWidget.of(context).deviceType;
    return Scaffold(
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
        onCollapsedActionClicked: () {},
      ),
      body: Center(
        child: Text(deviceType.name.toString()),
      ),
    );
  }
}
