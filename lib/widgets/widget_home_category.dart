import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class WidgetHomeCategory extends StatefulWidget {
  /// pass the parameter for the needed api service
  /// convert the entire class to a consumer widget for the passed state
  const WidgetHomeCategory({super.key});

  @override
  State<WidgetHomeCategory> createState() => _WidgetHomeCategoryState();
}

class _WidgetHomeCategoryState extends State<WidgetHomeCategory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 14),
                child: Text(
                  'Popular Categories',
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 4),
                child: Text(
                  'View All',
                  style: TextStyle(color: blackColor),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
