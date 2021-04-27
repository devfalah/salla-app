import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/view_model/auth_view_model.dart';
import 'package:shop_app/helper/constant.dart';
import 'package:shop_app/view/auth/login_view.dart';
import 'package:shop_app/view/widget/custom_text.dart';
import 'package:shop_app/view/widget/custom_text_button.dart';
import 'package:shop_app/view/widget/custom_text_form.dart';

class RegisterView extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<AuthViewModel>(
          init: AuthViewModel(),
          builder: (controller) => Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "REGISTER",
                  fontSize: 30,
                ),
                CustomText(
                  text: "Register now to browse our hot offers",
                  color: Colors.grey,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  hintText: "Name",
                  iconData: Icons.person,
                  keyboardType: TextInputType.name,
                  onSaved: (value) {
                    controller.name = value;
                  },
                  validator: (value) {},
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  hintText: "Email",
                  iconData: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    controller.email = value;
                  },
                  validator: (value) {},
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  hintText: "Password",
                  iconData: Icons.lock_outline,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onSaved: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) return "Password is so short";
                  },
                ),
                SizedBox(height: 30),
                CustomTextFormField(
                  hintText: "Phone",
                  iconData: Icons.phone,
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    controller.phone = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) return "Password is so short";
                  },
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.blue,
                  child: MaterialButton(
                    textColor: Colors.white,
                    child: Text("REGISTER"),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        controller.userSignIn();
                      }
                    },
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Do you have an account?",
                      color: Colors.black87,
                    ),
                    CustomTextButton(
                      text: "LOGIN",
                      color: primaryColor,
                      onPressed: () {
                        Get.to(LoginView(), transition: Transition.downToUp);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
