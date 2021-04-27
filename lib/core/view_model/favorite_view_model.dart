import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/service/dio_helper.dart';
import 'package:shop_app/helper/constant.dart';
import 'package:shop_app/model/favorite_model.dart';

class FavoriteViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get loading => _loading;
  FavoriteModel? favoriteModel;
  FavoriteViewModel() {
    getFavorite();
  }
  Future<void> changeFavorite(int prodId) async {
    if (!_loading.value) {
      favorites[prodId] = !favorites[prodId]!;
      await DioHelper.postData(
        url: 'favorites',
        data: {"product_id": prodId},
        query: {},
        token: token!,
      ).then((value) => null).catchError((e) {});
    } else {
      getFavorite();
    }

    update();
  }

  getFavorite() async {
    _loading.value = true;
    await DioHelper.getData(
      url: 'favorites',
      query: {},
      token: token!,
    ).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);

      _loading.value = false;
    }).catchError((e) {
      _loading.value = false;

      print(e);
    });
    update();
  }
}
