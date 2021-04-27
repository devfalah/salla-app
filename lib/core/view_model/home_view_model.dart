import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/service/dio_helper.dart';
import 'package:shop_app/helper/constant.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/model/search_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier<bool>(false);
  ValueNotifier<bool> _isSucsses = ValueNotifier<bool>(false);
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> get isSucsses => _isSucsses;
  ValueNotifier<bool> get isLoading => _isLoading;
  HomeModel? homeModel;
  CategoriesModel? categoriesModel;
  SearchModel? searchModel;

  String? text;

  @override
  onInit() {
    super.onInit();
    getCategoryData();
    getHomeData();
  }

  getHomeData() async {
    _loading.value = true;
    await DioHelper.getData(
      url: 'home',
      query: {},
      token: token!,
    ).then((value) {
      homeModel = HomeModel.fromMap(value.data);
      homeModel!.data.products.forEach((element) {
        favorites.addAll(
          {element.id: element.in_favorites},
        );
      });
      print(homeModel!.data.products.length);
      _loading.value = false;
    }).catchError((e) {
      _loading.value = false;

      print(e);
    });
    update();
  }

  getCategoryData() async {
    _loading.value = true;
    await DioHelper.getData(
      url: 'categories',
      token: token!,
      query: {},
    ).then((value) {
      categoriesModel = CategoriesModel.fromMap(value.data);

      _loading.value = false;
    }).catchError((e) {
      print(e);
    });
    update();
  }

  search() async {
    _isSucsses.value = false;
    _isLoading.value = true;
    await DioHelper.postData(
      url: 'products/search',
      token: token!,
      query: {},
      data: {
        'text': text,
      },
    ).then((value) {
      print('sucsses');
      searchModel = SearchModel.fromJson(value.data);
      _isSucsses.value = true;
      _isLoading.value = false;
    }).catchError((e) {
      print(e);
    });
    update();
  }
}
