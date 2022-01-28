import 'package:flutter/material.dart';
import 'package:portfolio/ui/components/components.dart';
import 'package:portfolio/ui/widgets/widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveData = ResponsiveWidget.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: responsiveData.preferredHeight - kToolbarHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home-banner.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: RowColumn(
        axis: (responsiveData.isDesktop) ? Axis.horizontal : Axis.vertical,
        children: [
          (responsiveData.isMobile)
              ? Container()
              : const Expanded(
                  flex: 1,
                  child: WelcomePagePicture(),
                ),
          const Expanded(
            child: WelcomePageSlogan(),
          ),
        ],
      ),
    );
  }
}
