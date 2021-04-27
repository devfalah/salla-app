import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/helper/cache_helper.dart';
import 'package:shop_app/helper/constant.dart';
import 'package:shop_app/model/on_boarding_model.dart';
import 'package:shop_app/view/auth/login_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widget/custom_text.dart';
import 'widget/custom_text_button.dart';

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List<OnBoardingModel> onBoardingItems = [
    OnBoardingModel(title: "Title 1", body: "body 1", imageName: "onboard.jpg"),
    OnBoardingModel(title: "Title 2", body: "body 2", imageName: "onboard.jpg"),
    OnBoardingModel(title: "Title 3", body: "body 3", imageName: "onboard.jpg"),
  ];
  bool isLast = false;

  var boardController = PageController();
  void sumbit() {
    CacheHelper.putData(key: 'onBoarding', value: true).then((value) {
      if (value) Get.offAll(LoginView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomTextButton(
            text: "SKIP",
            color: primaryColor,
            onPressed: () {
              sumbit();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(),
                itemCount: onBoardingItems.length,
                itemBuilder: (_, index) => BoardingItem(onBoardingItems[index]),
                onPageChanged: (index) {
                  if (index == onBoardingItems.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: primaryColor,
                    spacing: 5.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    if (isLast) {
                      sumbit();
                    } else {
                      boardController.nextPage(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.bounceIn,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BoardingItem extends StatelessWidget {
  final OnBoardingModel model;

  const BoardingItem(this.model);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/${model.imageName}'),
        SizedBox(height: 30),
        CustomText(
          text: model.title,
          fontSize: 24,
        ),
        SizedBox(height: 15),
        CustomText(
          text: model.body,
          fontSize: 14,
        ),
      ],
    );
  }
}
