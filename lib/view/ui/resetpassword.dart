import 'package:amplify_ui_component/view/ui/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/base_constant/base_constants.dart';
import '../utils/helper/helpers.dart';
import '../utils/widgets/widgets.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            size: 14,
            color: BaseColors.black,
            Icons.arrow_back_ios,
          ),
        ),
        centerTitle: true,
        title: const TextView(
          textColor: BaseColors.black,
          fontSize: 16,
          BaseStrings.resetPassword,
          color: BaseColors.black,
          fontWeight: FontWeight.w500,
          fontFamily: 'Spartan',
          textAlign: TextAlign.center,
          fontStyle: FontStyle.normal,
        ),
        elevation: 0.0,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(BaseAssets.signInBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              27.toVSB,
              const Align(
                alignment: Alignment.centerLeft,
                child: TextView(
                  BaseStrings.enterNewPasswordAndConfirm,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'Lato',
                  fontStyle: FontStyle.normal,
                ),
              ),
              20.toVSB,
              CustomTextFormField(
                isPassword: true,
                obscureText: true,
                textInputAction: TextInputAction.next,
                onChanged: validatePasswordLength,
                /*  onChanged: validatePasswordLength,
                      validator: validatePasswordLength,*/
                /* textEditingController:
                signInScreenController.passwordController,*/
                // bgColor: Colors.white,
                border: 10,
                // bgBorderColor: Colors.grey,
                labelText: BaseStrings.newPassword,
              ),
              10.toVSB,
              CustomTextFormField(
                isPassword: true,
                obscureText: true,
                textInputAction: TextInputAction.next,
                onChanged: validatePasswordLength,
                /*  onChanged: validatePasswordLength,
                      validator: validatePasswordLength,*/
                /* textEditingController:
                signInScreenController.passwordController,*/
                // bgColor: Colors.white,
                border: 10,
                // bgBorderColor: Colors.grey,
                labelText: BaseStrings.confirmPassword,
              ),
              20.toVSB,
              CustomRaisedButton(
                width: Get.width,
                bgBorderColor: Colors.transparent,
                bgColor: BaseColors.black,
                border: 10,
                onTap: () {
                  Get.to(
                    SignUpScreen(),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: TextView(
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Lato',
                    fontSize: 18,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                    color: BaseColors.white,
                    BaseStrings.changePassword,
                    // textStyle: BaseStyles.readMoreText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
