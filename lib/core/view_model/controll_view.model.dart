import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/helper/cache_helper.dart';
import 'package:shop_app/view/categores_view.dart';
import 'package:shop_app/view/favorite_view.dart';
import 'package:shop_app/view/product_view.dart';
import 'package:shop_app/view/setting_view.dart';

class ControllViewModel extends GetxController {
  bool onBoarding = false;
  int currentIndex = 0;
  Widget currentView = ProductView();
  ControllViewModel() {
    getData();
  }
  getData() async {
    onBoarding = await CacheHelper.getData('onBoarding');
    print(onBoarding);
    update();
  }

  void changeView(int index) {
    currentIndex = index;
    switch (currentIndex) {
      case 0:
        currentView = ProductView();
        break;
      case 1:
        currentView = CategoriesView();
        break;
      case 2:
        currentView = FavoriteView();
        break;
      case 3:
        currentView = SettingView();
        break;
    }
    update();
  }
}
