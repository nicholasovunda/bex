import 'dart:async';

import 'package:bex/constants/size.dart';
import 'package:bex/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/currency_formatter.dart';
import '../../domain/product.dart';

class ItemsContainer extends ConsumerStatefulWidget {
  const ItemsContainer({super.key, required this.product});
  final Product product;
  @override
  ItemsContainerState createState() => ItemsContainerState();
}

class ItemsContainerState extends ConsumerState<ItemsContainer> {
  bool gradient = false;
  @override
  Widget build(BuildContext context) {
    // int price = int.parse(widget.product.price!);
    // final priceFormatted = ref.watch(currencyFormatterProvider).format(price);
    return GestureDetector(
      onTap: () {
        setState(() {
          gradient = true;
        });
        Timer(
            const Duration(seconds: 1), () => setState(() => gradient = false));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          border: gradient
              ? const GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffee2c82),
                      Color(0xfffb6962),
                      Color(0xff4aeadc)
                    ],
                  ),
                  width: 1,
                )
              : Border.all(color: greyColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 80,
                height: 100,
                image: NetworkImage(widget.product.images![0].src.toString()),
              ),
              gapH2,
              ProductText(
                value: widget.product.name ?? '',
                weight: FontWeight.bold,
              ),
              gapH8,
              Text(
                '₦ ${widget.product.price}',
                style: const TextStyle(
                  fontSize: 13.0,
                  color: greyText,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w500,
                ),
              ),
              gapH4,
              ProductText(
                value: '₦ ${widget.product.regularPrice}',
                weight: FontWeight.w500,
                color: Colors.black87,
              ),
              gapH8,
              const ProductText(
                value: 'NEW',
                weight: FontWeight.normal,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductText extends StatelessWidget {
  final String value;
  final FontWeight weight;
  final Color? color;
  final double? size;
  const ProductText({
    required this.value,
    required this.weight,
    this.size,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        value,
        maxLines: 3,
        softWrap: true,
        overflow: TextOverflow.clip,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: size ?? 14.0,
          fontWeight: weight,
        ),
      ),
    );
  }
}
