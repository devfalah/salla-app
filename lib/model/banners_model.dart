import 'dart:convert';

class BannersModel {
  int id;
  String image;
  BannersModel({
    required this.id,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  factory BannersModel.fromMap(Map<String, dynamic> map) {
    return BannersModel(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BannersModel.fromJson(String source) =>
      BannersModel.fromMap(json.decode(source));
}
