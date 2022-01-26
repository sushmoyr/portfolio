import 'package:flutter/material.dart';
import 'package:portfolio/ui/components/responsive_appbar.dart';
import 'package:portfolio/ui/widgets/responsive.dart';
import 'package:portfolio/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResponsiveWidget(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
