import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/responsive.dart';

enum AppbarOnScrollBehaviour { hide, elevate }

class ResponsiveAppbar extends StatefulWidget implements PreferredSizeWidget {
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
    this.behaviour = AppbarOnScrollBehaviour.elevate,
    this.scrollController,
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
  final AppbarOnScrollBehaviour behaviour;
  final ScrollController? scrollController;

  @override
  State<ResponsiveAppbar> createState() => _ResponsiveAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ResponsiveAppbarState extends State<ResponsiveAppbar> {
  @override
  void initState() {
    if (widget.scrollController != null) {
      widget.scrollController!.addListener(_scrollListener);
    }
    super.initState();
  }

  bool elevated = false;
  bool hidden = false;
  double elevation = 0;

  void _scrollListener() {
    var controller = widget.scrollController;
    if (widget.behaviour == AppbarOnScrollBehaviour.elevate) {
      if (controller!.offset > kToolbarHeight) {
        if (!elevated) {
          setState(() {
            elevated = true;
            elevation = widget.elevation ?? 4;
          });
        }
      } else {
        if (elevated) {
          setState(() {
            elevation = 0;
            elevated = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var responsiveData = ResponsiveWidget.of(context);
    return Material(
      elevation: elevation,
      color: widget.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalPadding,
        ),
        child: _buildAppBar(context, responsiveData),
      ),
    );
  }

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
            padding: widget.leadingPadding ?? EdgeInsets.all(8),
            child: widget.leading,
          ),
          Wrap(
            children: List.generate(
              widget.destinations.length,
              (index) => InkWell(
                onTap: (widget.onActionItemClicked != null)
                    ? () => widget.onActionItemClicked!(index)
                    : null,
                child: widget.destinations[index],
              ),
            ),
            spacing: widget.actionItemSpacing ?? 0,
          ),
        ],
      );

  Widget _buildMobileAppbar(context) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: widget.leadingPadding ?? EdgeInsets.all(8),
            child: widget.leading,
          ),
          Padding(
            padding: widget.collapsedActionPadding ?? EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: widget.collapsedAction,
            ),
          ),
        ],
      );
}
/*

 */
