import 'dart:convert';

import 'package:shop_app/model/banners_model.dart';
import 'package:shop_app/model/product_model.dart';

class HomeModel {
  bool status;
  HomeDataModel data;
  HomeModel({
    required this.status,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'data': data.toMap(),
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      status: map['status'] ?? false,
      data: HomeDataModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source));
}

class HomeDataModel {
  List<BannersModel> banners;
  List<ProductsModel> products;
  HomeDataModel({
    required this.banners,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return {
      'banners': banners.map((x) => x.toMap()).toList(),
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeDataModel.fromMap(Map<String, dynamic> map) {
    return HomeDataModel(
      banners: List<BannersModel>.from(
          map['banners']?.map((x) => BannersModel.fromMap(x)) ?? const []),
      products: List<ProductsModel>.from(
          map['products']?.map((x) => ProductsModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeDataModel.fromJson(String source) =>
      HomeDataModel.fromMap(json.decode(source));
}
