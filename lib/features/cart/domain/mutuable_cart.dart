import '../../product/domain/product.dart';
import 'cart.dart';
import 'item.dart';

extension MutableCart on Cart {
  Cart setItem(Item item) {
    final copy = Map<ProductID, int>.from(items);
    copy[item.productId] = item.quantity;
    return Cart(copy);
  }

  Cart addItem(Item item) {
    final copy = Map<ProductID, int>.from(items);
    copy.update(
      item.productId,
      (value) => item.quantity + value,
      ifAbsent: () => item.quantity,
    );
    return Cart(copy);
  }

  Cart additems(List<Item> itemsToAdd) {
    final copy = Map<ProductID, int>.from(items);
    for (var item in itemsToAdd) {
      copy.update(
        item.productId,
        (value) => item.quantity + value,
        ifAbsent: () => item.quantity,
      );
    }
    return Cart(copy);
  }

  Cart removeItemById(ProductID productID) {
    final copy = Map<ProductID, int>.from(items);
    copy.remove(productID);
    return Cart(copy);
  }
}
