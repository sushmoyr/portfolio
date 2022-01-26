import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/responsive.dart';

class ResponsiveAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ResponsiveAppbar({
    Key? key,
    required this.destinations,
    required this.collapsedAction,
    required this.leading,
    this.onActionItemClicked,
    this.onCollapsedActionClicked,
    this.leadingPadding,
    this.horizontalPadding = 16,
    this.verticalPadding = 8,
    this.actionItemSpacing,
    this.elevation,
    this.backgroundColor,
    this.collapsedActionPadding,
  }) : super(key: key);

  final List<Widget> destinations;
  final Widget collapsedAction;
  final Widget leading;
  final VoidCallback? onCollapsedActionClicked;
  final Function(int)? onActionItemClicked;
  final EdgeInsets? leadingPadding;
  final EdgeInsets? collapsedActionPadding;
  final double horizontalPadding;
  final double verticalPadding;
  final double? actionItemSpacing;
  final double? elevation;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    var responsiveData = ResponsiveWidget.of(context);
    return Material(
      elevation: elevation ?? 4,
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: _buildAppBar(context, responsiveData),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _buildAppBar(BuildContext context, ResponsiveData responsiveData) {
    if (responsiveData.isDesktop) {
      return _buildDesktopAppbar(context);
    } else {
      return _buildMobileAppbar(context);
    }
  }

  Widget _buildDesktopAppbar(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: leadingPadding ?? EdgeInsets.all(8),
            child: leading,
          ),
          Wrap(
            children: destinations,
            spacing: actionItemSpacing ?? 0,
          ),
        ],
      );

  Widget _buildMobileAppbar(context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: leadingPadding ?? EdgeInsets.all(8),
            child: leading,
          ),
          Padding(
            padding: collapsedActionPadding ?? EdgeInsets.all(8),
            child: InkWell(
              onTap: onCollapsedActionClicked,
              child: collapsedAction,
            ),
          ),
        ],
      );
}
