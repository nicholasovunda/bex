// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

typedef ProductID = String;

class Product {
  final int id;
  final String? name;
  final String? description;
  final String? shortDescription;
  final String? sku;
  final String? price;
  final String? regularPrice;
  final String? salesPrice;
  final String? stockStatus;

  List<Images>? images;
  final List<Categories> categories;

  Product(
    this.id,
    this.name,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salesPrice,
    this.stockStatus,
    this.images,
    this.categories,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'shortDescription': shortDescription,
      'sku': sku,
      'price': price,
      'regularPrice': regularPrice,
      'salesPrice': salesPrice,
      'stockStatus': stockStatus,
      'images': images?.map((x) => x.toMap()).toList(),
      'categories': categories.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['id'] as int,
      map['name'] != null ? map['name'] as String : null,
      map['description'] != null ? map['description'] as String : null,
      map['shortDescription'] != null
          ? map['shortDescription'] as String
          : null,
      map['sku'] != null ? map['sku'] as String : null,
      map['price'] != null ? map['price'] as String : null,
      map['regularPrice'] != null ? map['regularPrice'] as String : null,
      map['salesPrice'] != null ? map['salesPrice'] as String : null,
      map['stockStatus'] != null ? map['stockStatus'] as String : null,
      map['images'] != null
          ? List<Images>.from(
              (map['images'] as List<dynamic>).map<Images?>(
                (x) => Images.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      List<Categories>.from(
        (map['categories'] as List<dynamic>).map<Categories>(
          (x) => Categories.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Categories {
  int id;
  String name;
  Categories({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Images {
  String? src;

  Images({this.src});

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      src: map['src'] != null ? map['src'] as String : null,
    );
  }

  factory Images.fromJson(String source) =>
      Images.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'src': src,
    };
  }

  String toJson() => json.encode(toMap());
}
