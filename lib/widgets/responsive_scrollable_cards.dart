import 'package:bex/constants/break_point.dart';
import 'package:bex/widgets/responsive_center.dart';
import 'package:flutter/material.dart';

import '../constants/size.dart';

class ResponsiveScrollableCard extends StatelessWidget {
  const ResponsiveScrollableCard({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveCenter(
          maxContentWidth: Breakpoint.desktop,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(Sizes.p16),
                child: child,
              ),
            ),
          )),
    );
  }
}
