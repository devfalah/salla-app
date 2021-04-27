import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/home_view_model.dart';
import 'package:shop_app/view/widget/custom_text.dart';

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => ListView.separated(
        itemBuilder: (_, index) => buildListItem(controller, index),
        separatorBuilder: (_, index) => Divider(),
        itemCount: controller.categoriesModel!.data.data.length,
      ),
    );
  }

  Container buildListItem(HomeViewModel controller, int index) {
    return Container(
      width: 120,
      height: 120,
      child: ListTile(
        leading: Image.network(
          controller.categoriesModel!.data.data[index].image,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CustomText(
            text: controller.categoriesModel!.data.data[index].name,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {},
        ),
      ),
    );
  }
}
