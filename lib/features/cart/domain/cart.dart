import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../product/domain/product.dart';
import 'item.dart';

class Cart {
  final Map<ProductID, int> items;

  const Cart([this.items = const {}]);

  Map<String, dynamic> toMap() {
    return {
      'items': items,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      Map<ProductID, int>.from(map['items']),
    );
  }
  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Cart && mapEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}

extension CartItems on Cart {
  List<Item> toItemsList() {
    return items.entries.map((e) {
      return Item(
        productId: e.key,
        quantity: e.value,
      );
    }).toList();
  }
}
