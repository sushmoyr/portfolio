import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('About page');
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: ResponsiveWidget.of(context).preferredHeight - kToolbarHeight,
      child: Container(
        color: Colors.greenAccent,
      ),
    );
  }
}
