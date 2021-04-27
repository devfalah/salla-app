import 'package:get/get.dart';
import 'package:shop_app/core/service/dio_helper.dart';
import 'package:shop_app/helper/cache_helper.dart';
import 'package:shop_app/helper/constant.dart';
import 'package:shop_app/helper/end_point.dart';
import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/view/home_view.dart';

class AuthViewModel extends GetxController {
  String? name, email, password, phone, image;

  LoginModel? loginModel;
  void onInit() {
    getToken();
    super.onInit();
  }

  bool? get isToken => token != null;

  getToken() async {
    token = await CacheHelper.getData('token');

    update();
  }

  void userLogout() async {
    await DioHelper.postData(
      url: 'logout',
      data: {},
      token: token,
      query: {},
    ).then((value) => print(value.data['message'])).catchError((onError) {
      print(onError);
    });
    CacheHelper.removeData('token');
  }

  void userLogin() {
    DioHelper.postData(
      url: login,
      query: {},
      data: {
        'email': email,
        'password': password,
      },
    ).then(
      (value) {
        loginModel = LoginModel.fromMap(value.data);
        Get.snackbar(
          '',
          loginModel!.message!,
          snackPosition: SnackPosition.BOTTOM,
        );
        CacheHelper.putData(key: 'token', value: loginModel!.data!.token);
        Get.offAll(HomeView());
      },
    ).catchError(
      (error) {
        print("ee" + error.toString());
      },
    );
  }

  userSignIn() async {
    print("da");
    await DioHelper.postData(
      url: 'register',
      lang: 'ar',
      query: {},
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'image': 'image',
      },
    ).then(
      (value) {
        print(value.data);
        loginModel = LoginModel.fromMap(value.data);
        Get.snackbar(
          '',
          loginModel!.message!,
          snackPosition: SnackPosition.BOTTOM,
        );
        print(loginModel!.data!.token);
        CacheHelper.putData(key: 'token', value: loginModel!.data!.token);
        Get.offAll(HomeView());
      },
    ).catchError((e) {
      print(e.toString());
    });
  }
}
