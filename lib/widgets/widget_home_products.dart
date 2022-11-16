import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class WidgetHomeProducts extends StatefulWidget {
  final String labelName;
  final String tagId;
  const WidgetHomeProducts({
    super.key,
    required this.labelName,
    required this.tagId,
  });

  @override
  State createState() => _WidgetHomeProductsState();
}

class _WidgetHomeProductsState extends State<WidgetHomeProducts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext content) {
    return Container(
      color: bexColor,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: Text(
                  widget.labelName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(color: bexColor),
                  ),
                ),
              ),
            ],
          ),
          // _productsList(),
        ],
      ),
    );
  }

  // Widget _productsList() {
  //   final WooCommerce wooCommerce = WooCommerce();
  //   return FutureBuilder(
  //     future: wooCommerce.getProducts(),
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       if (snapshot.hasData) {
  //         return _buildList(snapshot.data!);
  //       }
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );
  // }

}
