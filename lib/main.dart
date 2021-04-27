import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/helper/binding.dart';
import 'package:shop_app/helper/constant.dart';
import 'package:shop_app/view/controll_view.dart';

import 'core/service/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      title: 'Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
        ),
        primarySwatch: primaryColor,
        fontFamily: 'jannah',
      ),
      home: ControllView(),
    );
  }
}
