import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/widgets.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        ResponsiveWidget.of(context).preferredHeight - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
