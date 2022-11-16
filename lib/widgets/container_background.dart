import 'package:flutter/material.dart';

import '../features/product/presentation/product_list/grid_view.dart';

class ContainerBackground extends StatelessWidget {
  const ContainerBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: const GridContainer());
  }
}
