import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/widgets.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/slide_animations.dart';

class ServiceComponent extends StatelessWidget {
  const ServiceComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platform = ResponsiveWidget.of(context);
    if (platform.isDesktop) {
      return _buildDesktopItems(context);
    }
    if (platform.isTablet) {
      return _buildTabletItems(context);
    }
    return _buildMobileItems(context);
  }

  Widget _buildDesktopItems(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TileCard(
              contentPadding: const EdgeInsets.all(24),
              borderRadius: 16,
              currentElevation: 0,
              hoverElevation: 16,
              animationDirection: SlideDirection.fromBottom,
              animationDuration: const Duration(milliseconds: 900),
              icon: Image.asset(flutterLogo),
              title: Text(
                flutterDev,
                style: _getHeadlineStyle(
                    Theme.of(context).textTheme, ResponsiveWidget.of(context)),
              ),
              description: const Align(
                child: Text(
                  flutterDevDescription,
                  textAlign: TextAlign.justify,
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
            child: TileCard(
              icon: Image.asset(androidLogo),
              contentPadding: const EdgeInsets.all(24),
              borderRadius: 16,
              currentElevation: 0,
              hoverElevation: 16,
              animationDirection: SlideDirection.fromBottom,
              animationDuration: const Duration(milliseconds: 1200),
              title: Text(
                nativeDev,
                style: _getHeadlineStyle(
                    Theme.of(context).textTheme, ResponsiveWidget.of(context)),
              ),
              description: const Align(
                alignment: Alignment.center,
                child: Text(
                  nativeDevDescription,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          Expanded(
            child: TileCard(
              icon: Image.asset(nodeJsLogo),
              contentPadding: const EdgeInsets.all(24),
              borderRadius: 16,
              currentElevation: 0,
              hoverElevation: 16,
              animationDirection: SlideDirection.fromBottom,
              animationDuration: const Duration(milliseconds: 1500),
              title: Text(
                backendDev,
                style: _getHeadlineStyle(
                    Theme.of(context).textTheme, ResponsiveWidget.of(context)),
              ),
              description: const Align(
                alignment: Alignment.center,
                child: Text(
                  backendDevDescription,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildMobileItems(BuildContext context) => Column(
        children: [
          TileCard(
            contentPadding: const EdgeInsets.all(24),
            borderRadius: 16,
            currentElevation: 0,
            hoverElevation: 16,
            animationDirection: SlideDirection.fromLeft,
            animationDuration: const Duration(milliseconds: 900),
            icon: Image.asset(flutterLogo),
            title: Text(
              flutterDev,
              style: _getHeadlineStyle(
                  Theme.of(context).textTheme, ResponsiveWidget.of(context)),
            ),
            description: const Align(
              child: Text(
                flutterDevDescription,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
              ),
              alignment: Alignment.center,
            ),
          ),
          TileCard(
            icon: Image.asset(androidLogo),
            contentPadding: const EdgeInsets.all(24),
            borderRadius: 16,
            currentElevation: 0,
            hoverElevation: 16,
            animationDirection: SlideDirection.fromLeft,
            animationDuration: const Duration(milliseconds: 120),
            title: Text(
              nativeDev,
              style: _getHeadlineStyle(
                  Theme.of(context).textTheme, ResponsiveWidget.of(context)),
            ),
            description: const Align(
              alignment: Alignment.center,
              child: Text(
                nativeDevDescription,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          TileCard(
            icon: Image.asset(nodeJsLogo),
            contentPadding: const EdgeInsets.all(24),
            borderRadius: 16,
            currentElevation: 0,
            hoverElevation: 16,
            animationDirection: SlideDirection.fromLeft,
            animationDuration: const Duration(milliseconds: 1500),
            title: Text(
              backendDev,
              style: _getHeadlineStyle(
                  Theme.of(context).textTheme, ResponsiveWidget.of(context)),
            ),
            description: const Align(
              alignment: Alignment.center,
              child: Text(
                backendDevDescription,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      );

  TextStyle _getHeadlineStyle(TextTheme theme, ResponsiveData platform) {
    if (platform.isDesktop) {
      return theme.headline4!.copyWith(color: Colors.black);
    } else if (platform.isTablet) {
      return theme.headline5!.copyWith(color: Colors.black);
    } else {
      return theme.headline6!;
    }
  }

  Widget _buildTabletItems(BuildContext context) {
    var titleStyle = Theme.of(context).textTheme.headline6;
    var subTitleStyle = Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(color: Colors.grey.shade700);
    var shape = RoundedRectangleBorder(
      side: BorderSide(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(16),
    );

    var gap = const SizedBox(height: 24);

    return Column(
      children: [
        HoverListTile(
          leading: Image.asset(flutterLogo),
          shape: shape,
          title: Text(
            flutterDev,
            style: titleStyle,
          ),
          subtitle: Text(
            flutterDevDescription,
            style: subTitleStyle,
          ),
          animationDuration: const Duration(milliseconds: 900),
        ),
        gap,
        HoverListTile(
          leading: Image.asset(androidLogo),
          shape: shape,
          title: Text(
            nativeDev,
            style: titleStyle,
          ),
          subtitle: Text(
            nativeDevDescription,
            style: subTitleStyle,
          ),
          animationDuration: const Duration(milliseconds: 1200),
        ),
        gap,
        HoverListTile(
          leading: Image.asset(flutterLogo),
          shape: shape,
          title: Text(
            backendDev,
            style: titleStyle,
          ),
          subtitle: Text(
            backendDevDescription,
            style: subTitleStyle,
          ),
          animationDuration: const Duration(milliseconds: 1500),
        ),
      ],
    );
  }
}

class HoverListTile extends StatefulWidget {
  const HoverListTile({
    Key? key,
    this.currentElevation = 0,
    this.hoverElevation = 8,
    this.leading,
    this.title,
    this.subtitle,
    this.shape,
    this.animationDuration = Duration.zero,
  }) : super(key: key);

  final double currentElevation;
  final double hoverElevation;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final ShapeBorder? shape;
  final Duration animationDuration;

  @override
  State<HoverListTile> createState() => _HoverListTileState();
}

class _HoverListTileState extends State<HoverListTile> {
  late double elevation;

  @override
  void initState() {
    elevation = widget.currentElevation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          elevation = widget.hoverElevation;
        });
      },
      onExit: (event) {
        setState(() {
          elevation = widget.currentElevation;
        });
      },
      child: Material(
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          leading: widget.leading,
          title: widget.title,
          subtitle: widget.subtitle,
          shape: widget.shape,
        ),
        elevation: elevation,
      ),
    ).slideAnimation(duration: widget.animationDuration);
  }
}
