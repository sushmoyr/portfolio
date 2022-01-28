import 'package:flutter/material.dart';

class InheritedResponsiveWidget extends InheritedWidget {
  final ResponsiveData data;

  const InheritedResponsiveWidget(
      {Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedResponsiveWidget oldWidget) =>
      data != oldWidget.data;
}

class ResponsiveWidget extends StatelessWidget {
  final Widget child;
  const ResponsiveWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Calculate Preferred Size For Pages
    var deviceType = _deviceType(context);
    var ratioType = _ratioType(context);
    var ratio = MediaQuery.of(context).size.aspectRatio;
    var screenSize = MediaQuery.of(context).size;

    var height;
    print(ratio);

    if (deviceType == DeviceType.mobile) {
      if (ratio <= RatioBreakPoints.mobileRatio) {
        height = screenSize.height;
      } else {
        print('change');
        height = screenSize.width / RatioBreakPoints.mobileRatio;
      }

      print('Height: $height');
    } else if (deviceType == DeviceType.tab) {
      if (ratio <= RatioBreakPoints.tabletRatio) {
        height = screenSize.height;
      } else {
        height = screenSize.width / RatioBreakPoints.tabletRatio;
      }
    } else {
      height = screenSize.height;
    }

    return InheritedResponsiveWidget(
        data: ResponsiveData(
          deviceType,
          ratioType,
          ratio,
          height,
        ),
        child: child);
  }

  DeviceType _deviceType(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    double breakPoint;

    /*if (orientation == Orientation.portrait) {
      breakPoint = MediaQuery.of(context).size.width;
    } else {
      breakPoint = MediaQuery.of(context).size.height;
    }
    print(orientation);
    print(breakPoint);*/

    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 640) {
      return DeviceType.mobile;
    } else if (screenWidth <= 1007) {
      return DeviceType.tab;
    } else {
      return DeviceType.desktop;
    }
  }

  RatioType _ratioType(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double ratio = size.aspectRatio;
    if (ratio <= RatioBreakPoints.mobileRatio) {
      return RatioType.mobile;
    } else if (ratio <= RatioBreakPoints.tabletRatio) {
      return RatioType.tab;
    } else {
      return RatioType.desktop;
    }
  }

  static ResponsiveData of(BuildContext context) {
    final InheritedResponsiveWidget? data =
        context.dependOnInheritedWidgetOfExactType<InheritedResponsiveWidget>();
    if (data != null) {
      return data.data;
    } else {
      throw Exception('No Inherited Widget Found');
    }
  }
}

class ResponsiveData {
  final DeviceType deviceType;
  final RatioType ratioType;
  final double aspectRatio;
  final double preferredHeight;

  const ResponsiveData(
    this.deviceType,
    this.ratioType,
    this.aspectRatio,
    this.preferredHeight,
  );

  get isMobile => deviceType == DeviceType.mobile;

  get isDesktop => deviceType == DeviceType.desktop;

  get isTablet => deviceType == DeviceType.tab;

  get isMobileRatio => ratioType == RatioType.mobile;

  get isDesktopRatio => ratioType == RatioType.desktop;

  get isTabletRatio => ratioType == RatioType.tab;
}

enum DeviceType { desktop, tab, mobile }

enum RatioType { desktop, tab, mobile }

class RatioBreakPoints {
  static const mobileRatio = 0.65;
  static const tabletRatio = 1.2;
}

class SizeBreakPoints {
  static const mobileWidth = 640;
  static const tabletWidth = 1007;
}
