import 'dart:math';

import 'package:bex/features/product/data/product_repository.dart';
import 'package:bex/features/product/domain/product.dart';
import 'package:bex/features/product/presentation/product_list/items_container.dart';
import 'package:bex/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/size.dart';

class GridContainer extends ConsumerWidget {
  const GridContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListValue = ref.watch(productListStreamProvider);
    return AsyncValueWidget<List<Product>>(
      value: productListValue,
      data: (products) => products.isEmpty
          ? const Center(
              child: Text(
                'No Products Found',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          : ProductGridLayout(
              itemCount: products.length,
              itemBuilder: (_, index) {
                final product = products[index];
                return ItemsContainer(
                  product: product,
                );
              },
            ),
      // ),
      // ),
    );
  }
}

class ProductGridLayout extends StatelessWidget {
  const ProductGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = max(1, width ~/ 150);
        final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
        final numRows = (itemCount / crossAxisCount).ceil();
        final rowSizes = List.generate(numRows, (_) => auto);
        return LayoutGrid(
          columnSizes: columnSizes,
          rowSizes: rowSizes,
          rowGap: Sizes.p20,
          columnGap: Sizes.p8,
          children: [
            for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
          ],
        );
      },
    );
  }
}
