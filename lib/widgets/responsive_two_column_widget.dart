import 'package:bex/constants/break_point.dart';
import 'package:flutter/material.dart';

class ResponsiveTwoColumnLayout extends StatelessWidget {
  const ResponsiveTwoColumnLayout({
    super.key,
    required this.startContent,
    required this.endContent,
    required this.startFlex,
    required this.endFlex,
    required this.breakpoint,
    required this.spacing,
    required this.rowMainAxisAlignment,
    required this.rowCrossAxisAlignment,
    required this.columnMainAxisAlignment,
    required this.columnCrossAxisAlignment,
  });
  final Widget startContent;
  final Widget endContent;
  final int startFlex;
  final int endFlex;
  final double breakpoint;
  final double spacing;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Breakpoint.desktop) {
          return Row(
            mainAxisAlignment: rowMainAxisAlignment,
            crossAxisAlignment: rowCrossAxisAlignment,
            children: [
              Flexible(
                flex: startFlex,
                child: startContent,
              ),
              SizedBox(
                width: spacing,
              ),
              Flexible(
                flex: endFlex,
                child: endContent,
              ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: columnMainAxisAlignment,
            crossAxisAlignment: columnCrossAxisAlignment,
            children: [
              startContent,
              SizedBox(
                height: spacing,
              ),
              endContent,
            ],
          );
        }
      },
    );
  }
}
