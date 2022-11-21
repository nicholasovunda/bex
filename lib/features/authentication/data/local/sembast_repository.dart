import 'package:bex/features/authentication/data/local/local_cart_repository.dart';
import 'package:bex/features/cart/domain/cart.dart';
import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class SembastRepository implements LocalCartRepository {
  final Database db;
  final store = StoreRef.main();
  SembastRepository(this.db);
  static Future<Database> createDatabase(String filename) async {
    if (!kIsWeb) {
      final appDir = await getApplicationDocumentsDirectory();
      return databaseFactoryIo.openDatabase('${appDir.path}/$filename');
    } else {
      return databaseFactoryWeb.openDatabase(filename);
    }
  }

  static Future<SembastRepository> makeDefault() async {
    return SembastRepository(await createDatabase('default.db'));
  }

  static const cartItemKey = 'cartItem';
  @override
  Future<Cart> fetchCart() async {
    final cartJson = await store.record(cartItemKey).get(db) as String?;
    if (cartJson != null) {
      return Cart.fromJson(cartJson);
    } else {
      return const Cart();
    }
  }

  @override
  Future<void> setCart(Cart cart) {
    return store.record(cartItemKey).put(db, cart.toJson());
  }

  @override
  Stream<Cart> watchCart() {
    final record = store.record(cartItemKey);
    return record.onSnapshot(db).map((snapshot) {
      if (snapshot != null) {
        return Cart.fromJson(snapshot.value);
      } else {
        return const Cart();
      }
    });
  }
}
