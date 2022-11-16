import 'package:flutter/material.dart';

import '../../../../constants/size.dart';
import '../../domain/product.dart';

class ProductAverageRating extends StatelessWidget {
  const ProductAverageRating({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        gapW8,
        Text(product.name ?? '')
      ],
    );
  }
}
