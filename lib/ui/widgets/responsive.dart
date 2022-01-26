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
    return InheritedResponsiveWidget(
        data: ResponsiveData(_deviceType(context)), child: child);
  }

  DeviceType _deviceType(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 768) {
      return DeviceType.mobile;
    } else if (screenWidth <= 1366) {
      return DeviceType.tab;
    } else {
      return DeviceType.desktop;
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

  const ResponsiveData(this.deviceType);

  get isMobile => deviceType == DeviceType.mobile;

  get isDesktop => deviceType == DeviceType.desktop;

  get isTablet => deviceType == DeviceType.tab;
}

enum DeviceType { desktop, tab, mobile }

/*


static ResponsiveWrapperData of(BuildContext context) {
    final InheritedResponsiveWrapper? data = context
        .dependOnInheritedWidgetOfExactType<InheritedResponsiveWrapper>();
    if (data != null) return data.data;
    throw FlutterError.fromParts(
      <DiagnosticsNode>[
        ErrorSummary(
            'ResponsiveWrapper.of() called with a context that does not contain a ResponsiveWrapper.'),
        ErrorDescription(
            'No Responsive ancestor could be found starting from the context that was passed '
            'to ResponsiveWrapper.of(). Place a ResponsiveWrapper at the root of the app '
            'or supply a ResponsiveWrapper.builder.'),
        context.describeElement('The context used was')
      ],
    );
  }
}
 */
