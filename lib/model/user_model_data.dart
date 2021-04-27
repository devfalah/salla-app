import 'dart:convert';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String token;
  int? point;
  int? credit;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token = '',
    this.point,
    this.credit,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'token': token,
      'point': point,
      'credit': credit,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      image: map['image'],
      token: map['token'] ?? '',
      point: map['point'],
      credit: map['credit'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
