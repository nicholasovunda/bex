import 'package:bex/features/authentication/data/local/local_cart_repository.dart';
import 'package:bex/features/cart/domain/cart.dart';

import '../../../../utils/in_memory_store.dart';

class FacadeLocalRepository implements LocalCartRepository {
  final _cart = InMemoryStore<Cart>(const Cart());
  @override
  Future<Cart> fetchCart() => Future.value(_cart.value);

  @override
  Future<void> setCart(Cart cart) async {
    _cart.value = cart;
  }

  @override
  Stream<Cart> watchCart() => _cart.stream;
}
