// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  int categoryId;
  String categoryName;
  String categoryDesc;
  int? parent;
  ImageFile? image;

  Category({
    required this.categoryDesc,
    required this.categoryId,
    required this.categoryName,
    this.image,
    this.parent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'categoryName': categoryName,
      'categoryDesc': categoryDesc,
      'parent': parent,
      'image': image?.toMap(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      categoryId: map['categoryId'] as int,
      categoryName: map['categoryName'] as String,
      categoryDesc: map['categoryDesc'] as String,
      parent: map['parent'] != null ? map['parent'] as int : null,
      image: map['image'] != null
          ? ImageFile.fromMap(map['image'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ImageFile {
  String? url;

  ImageFile({this.url});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory ImageFile.fromMap(Map<String, dynamic> map) {
    return ImageFile(
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageFile.fromJson(String source) =>
      ImageFile.fromMap(json.decode(source) as Map<String, dynamic>);
}
