part of screens;

class ForgotPassword extends GetView<ForgotPasswordController> {
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            BaseStrings.forgotPasswordTitle,
            color: BaseColors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Spartan',
            textAlign: TextAlign.center,
            fontStyle: FontStyle.normal,
          ),
          elevation: 0.0,
        ),
        // resizeToAvoidBottomInset: true,
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
                const TextView(
                  BaseStrings.forgotPasswordDescription,
                  color: BaseColors.black,
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.7,
                ),
                26.toVSB,
                Form(
                  child: Column(
                    children: [
                      Obx(
                        () => CustomTextFormField(
                          suffixIcon: Visibility(
                            visible: forgotPasswordController
                                    .emailCorrectBool.value ==
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
                          // validator: validateEmail,
                          textEditingController:
                              forgotPasswordController.emailController,
                          /* bgColor: Colors.white,*/
                          border: 10,
                          labelText: BaseStrings.email,
                        ),
                      ),
                      20.toVSB,
                      CustomRaisedButton(
                        width: Get.width,
                        bgBorderColor: Colors.transparent,
                        bgColor: BaseColors.black,
                        border: 10,
                        onTap: () {
                        forgotPasswordController.resetPassword();
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
                            BaseStrings.send,
                            // textStyle: BaseStyles.readMoreText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
