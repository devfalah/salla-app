import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/favorite_view_model.dart';
import 'package:shop_app/core/view_model/home_view_model.dart';
import 'package:shop_app/helper/constant.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/model/product_model.dart';
import 'package:shop_app/view/widget/custom_text.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : ProductBuilder(
              homeModel: controller.homeModel!,
              categoriesModel: controller.categoriesModel!,
            ),
    );
  }
}

class ProductBuilder extends StatelessWidget {
  final HomeModel homeModel;
  final CategoriesModel categoriesModel;

  const ProductBuilder(
      {required this.homeModel, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCarouselSlider(),
          SizedBox(height: 10),
          CustomText(
            text: "Categories",
            fontSize: 24,
          ),
          Container(
            height: 110.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => buildStack(
                categoriesModel.data.data[index].image,
                categoriesModel.data.data[index].name,
              ),
              separatorBuilder: (_, index) => SizedBox(
                width: 10.0,
              ),
              itemCount: categoriesModel.data.data.length,
            ),
          ),
          CustomText(
            text: "New Product",
            fontSize: 24,
          ),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.63,
              children: List.generate(
                homeModel.data.products.length,
                (int index) {
                  return GridProduct(homeModel.data.products[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStack(String image, String name) {
    return Column(
      children: [
        Image.network(
          image,
          width: 80,
          height: 80,
        ),
        CustomText(
          text: name,
          fontSize: 12.0,
        ),
      ],
    );
  }

  Widget buildCarouselSlider() {
    return CarouselSlider(
      items: homeModel.data.banners
          .map(
            (e) => Image.network(
              e.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 180.0,
        initialPage: 0,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.easeInCirc,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class GridProduct extends StatelessWidget {
  final ProductsModel productsModel;
  GridProduct(this.productsModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image.network(
              productsModel.image,
              height: 200.0,
              width: double.infinity,
            ),
            if (productsModel.discount != 0)
              Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CustomText(
                  text: "DISCOUNT",
                  fontSize: 10,
                  color: Colors.white,
                ),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: productsModel.name,
                maxLines: 1,
                fontSize: 14,
                isOverflow: true,
              ),
              Row(
                children: [
                  CustomText(
                    text: "\$" + productsModel.price.toString(),
                    maxLines: 1,
                    fontSize: 14,
                    color: primaryColor,
                  ),
                  SizedBox(width: 5.0),
                  if (productsModel.discount != 0)
                    CustomText(
                      text: "\$" + productsModel.old_price.toString(),
                      maxLines: 1,
                      fontSize: 14,
                      color: Colors.grey,
                      isLineThrough: true,
                    ),
                  Spacer(),
                  GetBuilder<FavoriteViewModel>(
                    init: Get.put(FavoriteViewModel()),
                    builder: (controller) => IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        favorites[productsModel.id]!
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        controller.changeFavorite(productsModel.id);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
