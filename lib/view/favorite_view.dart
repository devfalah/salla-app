import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/favorite_view_model.dart';
import 'package:shop_app/helper/constant.dart';
import 'package:shop_app/model/favorite_model.dart';
import 'package:shop_app/view/widget/custom_text.dart';

class FavoriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteViewModel>(
      init: FavoriteViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemBuilder: (_, index) =>
                  buildListItem(controller.favoriteModel!, index),
              separatorBuilder: (_, index) => Divider(),
              itemCount: controller.favoriteModel!.data.data.length,
            ),
    );
  }

  Widget buildListItem(FavoriteModel controller, int index) {
    return Container(
      width: 120,
      height: 120,
      child: Row(
        children: [
          Image.network(
            controller.data.data[index].product.image,
            width: 120,
            height: 120,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: controller.data.data[index].product.name,
                  isOverflow: true,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "\$" +
                          controller.data.data[index].product.price
                              .toStringAsFixed(0),
                      color: primaryColor,
                    ),
                    SizedBox(width: 10),
                    if (controller.data.data[index].product.discount != 0)
                      CustomText(
                        text: "\$" +
                            controller.data.data[index].product.oldPrice
                                .toStringAsFixed(0),
                        color: Colors.grey,
                        isLineThrough: true,
                      ),
                  ],
                ),
              ],
            ),
          ),
          GetBuilder<FavoriteViewModel>(
            init: Get.find(),
            builder: (controller) => IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                favorites[
                        controller.favoriteModel!.data.data[index].product.id]!
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                controller.changeFavorite(
                    controller.favoriteModel!.data.data[index].product.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
