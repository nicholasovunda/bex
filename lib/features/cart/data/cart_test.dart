import 'package:bex/features/application/woo_commerce.dart';

import '../domain/cart.dart';

Future getCart() async {
  final cartItems = wooCommerceAPI.getAsync('cart');
  return print(cartItems);
}
