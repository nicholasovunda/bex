import '../../../cart/domain/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class RemoteCartRepository {
  Future<Cart> fetchCart();

  Stream<Cart> watchCart();

  Future<void> setCart(Cart cart);
}

final localCartRepositoryProvider = Provider<RemoteCartRepository>((ref) {
  // * Override this in the main method
  throw UnimplementedError();
});
//TODO: set the remote call for the repository 