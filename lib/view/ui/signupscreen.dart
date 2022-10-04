part of screens;

class SignUpScreen extends GetView<SignupScreenController> {
  final SignupScreenController signupScreenController =
      Get.put(SignupScreenController());
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  SignUpScreen({super.key});

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
          BaseStrings.signup,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 00),
            child: Column(
              children: <Widget>[
                30.toVSB,
                Center(
                  child: Image.asset(
                    BaseAssets.logo,
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                10.toVSB,
                const TextView(
                  BaseStrings.signup,
                  color: BaseColors.black,
                  fontSize: 32,
                  fontFamily: 'Spatan',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                30.toVSB,
                Obx(
                  () => CustomTextFormField(
                    suffixIcon: Visibility(
                      visible:
                          signupScreenController.checkBoxBool.value == false,
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
                    onChanged: validateFirstName,
                    textEditingController:
                        signupScreenController.nameController,
                    /* bgColor: Colors.white,*/
                    border: 10,
                    labelText: "Name",
                  ),
                ),
                10.toVSB,
                Obx(
                  () => CustomTextFormField(
                    suffixIcon: Visibility(
                      visible:
                          signupScreenController.checkBoxBool.value == false,
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
                        signupScreenController.emailController,
                    /* bgColor: Colors.white,*/
                    border: 10,
                    labelText: BaseStrings.email,
                  ),
                ),
                10.toVSB,
                CustomTextFormField(
                  isPassword: true,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  onChanged: validatePasswordLength,
                  /*  onChanged: validatePasswordLength,
                    validator: validatePasswordLength,*/
                  textEditingController:
                      signupScreenController.conformPasswordController,
                  // bgColor: Colors.white,
                  border: 10,
                  // bgBorderColor: Colors.grey,
                  labelText: BaseStrings.password,
                ),
                10.toVSB,
                CustomTextFormField(
                  isPassword: true,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  onChanged: validatePasswordLength,
                  /*  onChanged: validatePasswordLength,
                    validator: validatePasswordLength,*/
                  textEditingController:
                      signupScreenController.passwordController,
                  // bgColor: Colors.white,
                  border: 10,
                  // bgBorderColor: Colors.grey,
                  labelText: BaseStrings.confirmPassword,
                ),
                10.toVSB,
                Container(
                  height: 60.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: BaseColors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: BaseColors.shadow.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        // offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: InternationalPhoneNumberInput(
                      countrySelectorScrollControlled: false,
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: const SelectorConfig(
                        showFlags: false,
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      maxLength: 12,
                      autoValidateMode: AutovalidateMode.disabled,
                      countries: const ["US"],
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: PhoneNumber(isoCode: 'US'),
                      textFieldController:
                          signupScreenController.phoneController,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      /*  inputBorder: const OutlineInputBorder(),*/
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
                ),
                /*  CustomTextFormField(
                  isPassword: false,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  // onChanged: validatePasswordLength,
                  onChanged: validatePasswordLength,
                  validator: validatePasswordLength,
                  textEditingController: signupScreenController.phoneController,
                  // bgColor: Colors.white,
                  border: 10,
                  // bgBorderColor: Colors.grey,
                  labelText: BaseStrings.phoneNumber,
                ),*/
                20.toVSB,
                CustomRaisedButton(
                  width: Get.width,
                  bgBorderColor: Colors.transparent,
                  bgColor: BaseColors.black,
                  border: 10,
                  onTap: () {
                    signupScreenController.signupSubmit();
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
                      BaseStrings.signup,
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
                          text: BaseStrings.alreadyHaveAnAccount,
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
                              Get.to(SignInScreen());
                            },
                          text: BaseStrings.signIn,
                          style: const TextStyle(
                              color: BaseColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                35.toVSB,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    BaseAssets.facebook,
                    height: 60.h,
                    width: 60.w,
                  ),
                  Image.asset(
                    BaseAssets.twitter,
                    height: 60.h,
                    width: 60.w,
                  ),
                  InkWell(
                    onTap: () {
                      _googleSignIn
                          .signIn()
                          .then(
                            (userData) {},
                          )
                          .catchError(
                            (e) {},
                          );
                    },
                    child: Image.asset(
                      BaseAssets.google,
                      height: 60.h,
                      width: 60.w,
                    ),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
