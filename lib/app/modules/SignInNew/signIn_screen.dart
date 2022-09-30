
import 'package:amplify_ui_component/app/modules/SignInNew/logic.dart';
import 'package:amplify_ui_component/app/theme/app_colors.dart';
import 'package:amplify_ui_component/app/utils/base_constant/base_constants.dart';
import 'package:amplify_ui_component/app/utils/helper/size_configs.dart';
import 'package:amplify_ui_component/app/utils/helper/validators.dart';
import 'package:amplify_ui_component/app/utils/widgets/custom_button.dart';
import 'package:amplify_ui_component/app/utils/widgets/custom_text_field.dart';
import 'package:amplify_ui_component/app/utils/widgets/text_view.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final SignInScreenController signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
           // Get.back();
          },
          child:  Icon(
            size: 14,
            color: nuetral,
            Icons.arrow_back_ios,
          ),
        ),
        centerTitle: true,
        title:  Text(
          "SIGN In",
          style:TextStyle(
            color: nuetral,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Spartan',
            //: TextAlign.center,
            fontStyle: FontStyle.normal,
          )

        ),
        elevation: 0.0,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(BaseAssets.signInBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: signInScreenController.signInFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding:
               EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      BaseAssets.logo,
                      width: 117.w,
                      height: 82.h,
                    ),
                  ),
                  10.toVSB,
                   TextView(
                    BaseStrings.welcomeBack,
                    color: nuetral,
                    fontSize: 32,
                    fontFamily: 'Spartan',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                  8.toVSB,
                   Text(BaseStrings.signInToContinue,
                      style: TextStyle(
                        fontSize: 18,
                        color: nuetral,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: false,
                      textAlign: TextAlign.center,
                      maxLines: 1),
                  26.toVSB,
                  Obx(
                        () => CustomTextFormField(
                      suffixIcon: Visibility(
                        visible: signInScreenController.checkBoxBool.value ==
                            false,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            BaseAssets.check,
                            width: 10.w,
                            height: 7.h,
                          ),
                        ),
                      ),
                      /*  signInScreenController.checkBoxBool.value ==
                                          false
                                      ? Image.asset(
                                          BaseAssets.check,
                                          width: 10.w,
                                          height: 10.h,
                                        )
                                      : const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),*/
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      onChanged: validateEmail,
                      textEditingController:
                      signInScreenController.emailController,
                      /* bgColor: Colors.white,*/
                      border: 10,
                      labelText: BaseStrings.email,
                    ),
                  ),
                  15.toVSB,
                  CustomTextFormField(
                    isPassword: true,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    onChanged: validatePasswordLength,
                    /*  onChanged: validatePasswordLength,
                      validator: validatePasswordLength,*/
                    textEditingController:
                    signInScreenController.passwordController,
                    // bgColor: Colors.white,
                    border: 10,
                    // bgBorderColor: Colors.grey,
                    labelText: BaseStrings.password,
                  ),
                  10.toVSB,
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Obx(
                                        () => Checkbox(
                                        visualDensity: const VisualDensity(
                                            horizontal: -4, vertical: -4),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        activeColor: BaseColors.black,
                                        side: BorderSide(
                                            width: 1,
                                            color: Theme.of(context)
                                                .unselectedWidgetColor),
                                        // Rounded Checkbox
                                        value: signInScreenController
                                            .rememberMeCheckBox.value,
                                        onChanged: (value) {
                                          signInScreenController
                                              .rememberMeCheckBox.value =
                                          !signInScreenController
                                              .rememberMeCheckBox.value;
                                        }),
                                  ),
                                   TextView(
                                    textAlign: TextAlign.end,
                                    BaseStrings.rememberMe,
                                    fontFamily: 'lato',
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                          //  Get.to( ForgotPassword());
                          },
                          child:  TextView(
                            BaseStrings.forgotPassword,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  20.toVSB,
                  CustomRaisedButton(
                    width: Get.width,
                    bgBorderColor: Colors.transparent,
                    bgColor: BaseColors.black,
                    border: 10,
                    onTap: () {
                      signInScreenController.signIn();
                     // signInScreenController.submit();
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
                        BaseStrings.signIn,
                        // textStyle: BaseStyles.readMoreText,
                      ),
                    ),
                  ),
                  20.toVSB,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        // style: TextStyle(color: Colors.black, fontSize: 36),
                        children: <InlineSpan>[
                           const TextSpan(
                            text: BaseStrings.dontHaveAnAccount,
                            style: TextStyle(color: BaseColors.black),
                          ),
                           const WidgetSpan(
                            child: SizedBox(
                              width: 5,
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                             //   Get.to(SignInScreen());
                              },
                            text: BaseStrings.signUp,
                            style: const TextStyle(
                                color: BaseColors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  35.toVSB,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                         // signInScreenController.signInWithFacebook();
                        },
                        child: Image.asset(
                          BaseAssets.facebook,
                          height: 60.h,
                          width: 60.w,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                        //  signInScreenController.loginWithTwitter();
                        },
                        child: Image.asset(
                          BaseAssets.twitter,
                          height: 60.h,
                          width: 60.w,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                        //  _googleSignIn.signIn().then((userData) {},).catchError((e) {},);
                        },
                        child: Image.asset(
                          BaseAssets.google,
                          height: 60.h,
                          width: 60.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


