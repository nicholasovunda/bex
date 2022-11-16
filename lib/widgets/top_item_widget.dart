import 'package:flutter/material.dart';

import '../utils/app_style.dart';
import 'package:dotted_border/dotted_border.dart';

/// Container for items that are being advertised on the page.
class TopItemWidget extends StatelessWidget {
  final String networkImage;
  const TopItemWidget({
    super.key,
    required this.networkImage,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [6, 4],
      color: bexColor,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Image.network(
            networkImage,
          ),
        ),
      ),
    );
  }
}
