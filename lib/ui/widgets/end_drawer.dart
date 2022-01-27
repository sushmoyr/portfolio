import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    Key? key,
    required this.destinations,
    this.spacing,
    this.onDestinationClicked,
  }) : super(key: key);

  final List<Widget> destinations;
  final double? spacing;
  final Function(int)? onDestinationClicked;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              Wrap(
                direction: Axis.vertical,
                children: _buildDestination(context),
                spacing: spacing ?? 0,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDestination(BuildContext context) {
    List<Widget> newDestinations = [];

    for (int i = 0; i < destinations.length; i++) {
      Widget child = destinations[i];
      Widget item = InkWell(
        child: child,
        onTap: () {
          if (onDestinationClicked != null) {
            onDestinationClicked!(i);
            Navigator.pop(context);
          }
        },
      );

      newDestinations.add(item);
    }

    return newDestinations;
  }
}
