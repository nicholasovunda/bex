import 'package:woocommerce_api/woocommerce_api.dart';
import 'package:riverpod/riverpod.dart';

WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
  url: 'https://bexstores.com/',
  consumerKey: 'ck_f03672bf8336082194ab4c0a4b71ad6699851886',
  consumerSecret: 'cs_a5de56959ee2aeff8b7667f5179c9f6cf8a1c58b',
);
final wooCommerce = Provider<WooCommerceAPI>((ref) => wooCommerceAPI);




// Future getCategory() async {
//   List<Category> data = [];
//   var category = await wooCommerceAPI.getAsync(Config.categoriesUrl);
//   data = (category as List).map((e) => Category.fromJson(e)).toList();
//   return data;
// }
