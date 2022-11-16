import 'package:bex/features/product/presentation/product_list/product_search_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../constants/size.dart';
import '../../../../widgets/responsive_center.dart';
import 'grid_view.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(dismissOnScreenKeyboard);
  }

  @override
  void dispose() {
    _scrollController.addListener(dismissOnScreenKeyboard);
    super.dispose();
  }

  void dismissOnScreenKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      Focus.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          ResponsiveSliverCenter(
            padding: EdgeInsets.symmetric(
                vertical: Sizes.p24, horizontal: Sizes.p20),
            child: ProductSearchTextField(),
          ),
          ResponsiveSliverCenter(
              padding: EdgeInsets.all(
                Sizes.p8,
              ),
              child: GridContainer())
        ],
      ),
    );
  }
}
