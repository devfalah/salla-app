import 'dart:convert';

class CategoriesModel {
  bool status;
  CategoriesDataModel data;
  CategoriesModel({
    required this.status,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'data': data.toMap(),
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      status: map['status'] ?? false,
      data: CategoriesDataModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source));
}

class CategoriesDataModel {
  int current_page;
  List<DataModel> data;
  CategoriesDataModel({
    required this.current_page,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'current_page': current_page,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoriesDataModel.fromMap(Map<String, dynamic> map) {
    return CategoriesDataModel(
      current_page: map['current_page'] ?? 0,
      data: List<DataModel>.from(
          map['data']?.map((x) => DataModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesDataModel.fromJson(String source) =>
      CategoriesDataModel.fromMap(json.decode(source));
}

class DataModel {
  int id;
  String name;
  String image;
  DataModel({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source));
}
