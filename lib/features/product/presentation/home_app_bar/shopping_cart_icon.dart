import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/size.dart';

class ShoppingCartIcon extends ConsumerWidget {
  const ShoppingCartIcon({super.key});
  static const shoppingCartIconKey = Key('shopping-cart');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this is a dummy value till cart is implemented
    int value = 1;
    // Call Cart information
    return Stack(
      children: [
        Center(
          child: IconButton(
            key: shoppingCartIconKey,
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              //TODO routing to user cart
            },
          ),
        ),
        if (value > 0)
          Positioned(
            top: Sizes.p4,
            bottom: Sizes.p4,
            child: ShoppingCartIconBadge(
              itemCount: value,
            ),
          )
      ],
    );
  }
}

class ShoppingCartIconBadge extends StatelessWidget {
  const ShoppingCartIconBadge({
    super.key,
    required this.itemCount,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.p16,
      height: Sizes.p16,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$itemCount',
          textAlign: TextAlign.center,
          textScaleFactor: 1.0,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
