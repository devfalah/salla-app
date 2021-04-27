import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/controll_view.model.dart';
import 'package:shop_app/view/search_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllViewModel>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Salla",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Get.to(SearchView());
              },
            ),
          ],
        ),
        body: controller.currentView,
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllViewModel>(
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: controller.currentIndex,
        onTap: (index) {
          controller.changeView(index);
        },
      ),
    );
  }
}
