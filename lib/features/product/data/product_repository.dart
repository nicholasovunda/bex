import 'dart:developer';

import '../../application/woo_commerce.dart';
import '../domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductRepository {
  ProductRepository(this.ref);
  final Ref ref;

  final List<Product> _product = [];
  List value = [];
  Future<List<Product>> getProducts() async {
    List products = await wooCommerceAPI.getAsync('products');
    for (var i = 0; i < products.length; i++) {
      var productList = products.map((e) => Product.fromMap(e));
      productList.forEach((element) {
        _product.add(Product(
          element.id,
          element.name,
          element.description,
          element.shortDescription,
          element.sku,
          element.price,
          element.regularPrice,
          element.salesPrice,
          element.stockStatus,
          element.images,
          element.categories,
        ));
      });
      print(products[i]['images'][0]['src']);
    }

    return _product;
  }

  Future<List<Product>> fetchProductList() async {
    var product = await getProducts();
    return Future.value(product);
  }

  Stream<List<Product>> watchProductList() async* {
    List<Product> product = await getProducts();
    yield product;
  }

  Stream<Product?> watchProduct(String name) {
    return watchProductList().map((products) => _getProduct(products, name));
  }

  Product? getProduct(String name) {
    return _getProduct(_product, name);
  }

  static Product? _getProduct(List<Product> products, String name) {
    try {
      return products.firstWhere((product) => product.name == name);
    } catch (e) {
      return null;
    }
  }
}

final productsRepositoryProvider = Provider<ProductRepository>(
  (ref) {
    return ProductRepository(ref);
  },
);

final productListStreamProvider =
    StreamProvider.autoDispose<List<Product>>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProductList();
});

final productsListFutureProvider =
    FutureProvider.autoDispose<List<Product>>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.fetchProductList();
});

final productProvider =
    StreamProvider.autoDispose.family<Product?, String>((ref, name) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProduct(name);
});
