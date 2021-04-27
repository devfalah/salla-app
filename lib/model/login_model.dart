import 'dart:convert';

import 'user_model_data.dart';

class LoginModel {
  bool? status;
  String? message;
  UserModel? data;
  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      status: map['status'],
      message: map['message'],
      data: map['data'] != null ? UserModel.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
