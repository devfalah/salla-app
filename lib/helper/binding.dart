import 'package:get/get.dart';
import 'package:shop_app/core/view_model/auth_view_model.dart';
import 'package:shop_app/core/view_model/controll_view.model.dart';
import 'package:shop_app/core/view_model/favorite_view_model.dart';
import 'package:shop_app/core/view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControllViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => FavoriteViewModel());
  }
}
