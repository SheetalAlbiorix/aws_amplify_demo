part of screens;

class VerifyPhoneNumber extends GetView<VerifyPhoneNumberController> {
  final VerifyPhoneNumberController verifyPhoneNumberController =
      Get.put(VerifyPhoneNumberController());

  VerifyPhoneNumber({super.key});

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
            BaseStrings.verifyYourPhoneNumber,
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
                const TextView(
                  BaseStrings.sendYourSmsCodeNumber,
                  color: BaseColors.black,
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.7,
                ),
                26.toVSB,
                Form(
                  key: verifyPhoneNumberController.verifyPhoneNumberFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 60.h,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: BaseColors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
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
                          child: IntlPhoneField(
                            // remove enabled to change country code
                            enabled: false,
                            initialValue: "123456789",
                            disableLengthCheck: true,
                            showDropdownIcon: false,
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.all(0),   //  <- you can it to 0.0 for no space
                              isDense: true,
                              labelText: BaseStrings.phoneNumber,
                              alignLabelWithHint: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              floatingLabelStyle: const TextStyle(
                                fontSize: 13,
                                color: BaseColors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            /*  onChanged: (phone) {
                              if (kDebugMode) {
                                print(phone.completeNumber);
                              }
                            },
                            onCountryChanged: (country) {
                              if (kDebugMode) {
                                print('Country changed to: ${country.name}');
                              }
                            },*/
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                    /* Get.to(  ConfirmationOtpCode());*/
                  },
                  /*  onTap: () {
                  verifyPhoneNumberController
                      .verifyPhoneNumberFormKey.currentState
                      ?.validate();
                },*/
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: TextView(
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      color: BaseColors.white,
                      BaseStrings.confirm,
                      // textStyle: BaseStyles.readMoreText,
                    ),
                  ),
                ),

                /*InkWell(
                  onTap: () {
                    Get.to(AccountCreated());


                  },
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
