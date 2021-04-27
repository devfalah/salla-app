import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/auth_view_model.dart';
import 'package:shop_app/core/view_model/controll_view.model.dart';
import 'package:shop_app/view/auth/login_view.dart';
import 'package:shop_app/view/home_view.dart';
import 'package:shop_app/view/on_boarding_view.dart';

class ControllView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllViewModel>(
      init: ControllViewModel(),
      builder: (controller) => !controller.onBoarding
          ? OnBoardingView()
          : GetBuilder<AuthViewModel>(
              init: Get.put(AuthViewModel()),
              builder: (authController) =>
                  authController.isToken == true ? HomeView() : LoginView(),
            ),
    );
  }
}
