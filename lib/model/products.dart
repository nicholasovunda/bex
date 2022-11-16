import 'dart:convert';

class ProductWoo {
  final int id;
  final String name;
  final String description;
  final String shortDescription;
  final String sku;
  final String price;
  final String regularPrice;
  final String salesPrice;
  final String? stockStatus;
  List<Images>? images;
  final List<Categories> categories;

  ProductWoo(
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

  factory ProductWoo.fromMap(Map<String, dynamic> map) {
    return ProductWoo(
      map['id'] as int,
      map['name'] as String,
      map['description'] as String,
      map['shortDescription'] as String,
      map['sku'] as String,
      map['price'] as String,
      map['regularPrice'] as String,
      map['salesPrice'] as String,
      map['stockStatus'] != null ? map['stockStatus'] as String : null,
      map['images'] != null
          ? List<Images>.from(
              (map['images'] as List<int>).map<Images?>(
                (x) => Images.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      List<Categories>.from(
        (map['categories'] as List<int>).map<Categories>(
          (x) => Categories.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductWoo.fromJson(String source) =>
      ProductWoo.fromMap(json.decode(source) as Map<String, dynamic>);
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
