import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/home_view_model.dart';
import 'package:shop_app/helper/constant.dart';
import 'package:shop_app/model/search_model.dart';
import 'package:shop_app/view/widget/custom_text.dart';
import 'package:shop_app/view/widget/custom_text_form.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'search',
                iconData: Icons.search,
                onSaved: (value) {
                  controller.text = value;
                },
                validator: (value) {},
                keyboardType: TextInputType.text,
                onFieldSubmitted: (v) {
                  controller.search();
                },
              ),
              SizedBox(height: 10.0),
              if (controller.isLoading.value) LinearProgressIndicator(),
              if (controller.isSucsses.value)
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) =>
                        buildListItem(controller.searchModel!, index),
                    separatorBuilder: (_, index) => Divider(),
                    itemCount: controller.searchModel!.data.data.length,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListItem(SearchModel controller, int index) {
    return Container(
      width: 120,
      height: 120,
      child: Row(
        children: [
          Image.network(
            controller.data.data[index].image,
            width: 120,
            height: 120,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: controller.data.data[index].name,
                  isOverflow: true,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "\$" +
                          controller.data.data[index].price.toStringAsFixed(0),
                      color: primaryColor,
                    ),
                    SizedBox(width: 10),
                    if (controller.data.data[index].discount != 0)
                      CustomText(
                        text: "\$" +
                            controller.data.data[index].oldPrice
                                .toStringAsFixed(0),
                        color: Colors.grey,
                        isLineThrough: true,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
