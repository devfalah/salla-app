import 'dart:convert';

class ProductsModel {
  int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String name;
  String description;
  String image;
  bool in_cart;
  bool in_favorites;
  ProductsModel({
    required this.id,
    required this.price,
    required this.old_price,
    required this.discount,
    required this.name,
    required this.description,
    required this.image,
    required this.in_cart,
    required this.in_favorites,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'old_price': old_price,
      'discount': discount,
      'name': name,
      'description': description,
      'image': image,
      'in_cart': in_cart,
      'in_favorites': in_favorites,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] ?? 0,
      price: map['price'],
      old_price: map['old_price'],
      discount: map['discount'],
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      in_cart: map['in_cart'] ?? false,
      in_favorites: map['in_favorites'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) =>
      ProductsModel.fromMap(json.decode(source));
}
