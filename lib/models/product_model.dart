// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  List<String>? images;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.images,
  });

  Product copyWith({
    int? id,
    String? name,
    String? description,
    String? price,
    List<String>? images,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'images': images?.map((image) => {'src': image}).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      images: map['images'] != null
          ? List<String>.from(
              map['images'].map((image) => image['src'] as String))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, price: $price, images: $images)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        images.hashCode;
  }
}


/*class Images {
  String? src;

  Images({this.src});

  factory Images.fromjson(Map<String, dynamic> mymap) {
    return Images(src: mymap['src']);
  }
}*/


 /*factory Product.fromjson(Map<String, dynamic> myjson) {
    return Product(
        id: myjson['id'],
        name: myjson['name'],
        description: myjson['description'],
        price: myjson['price'],
        images:
            List<Images>.from(myjson['images'].map((x) => Images.fromjson(x))));
  }*/