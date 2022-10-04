import 'package:amplify_ui_component/viewmodel/controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import '../utils/base_constant/base_constants.dart';
import '../utils/widgets/widgets.dart';

class ConfirmationOtpCode extends StatefulWidget {
    const ConfirmationOtpCode({Key? key}) : super(key: key);

  @override
  State<ConfirmationOtpCode> createState() => _ConfirmationOtpCodeState();
}

class _ConfirmationOtpCodeState extends State<ConfirmationOtpCode> {
  TextEditingController textEditingController = TextEditingController();
  final SignupScreenController signupScreenController = Get.find();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      /* border: Border.all(color:BaseColors.white,
          ),*/
      borderRadius: BorderRadius.circular(15.0),
    );
  }

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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 00.0),
          child: Column(
            children: <Widget>[
              30.toVSB,
              const Align(
                alignment: Alignment.centerLeft,
                child: TextView(
                  BaseStrings.enterYourOTPCodeHere,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontStyle: FontStyle.normal,
                ),
              ),
              27.toVSB,
              TextFieldPin(
                  autoFocus: true,
                  textController:
                      signupScreenController.confirmationCodeController,
                  codeLength: 6,
                  alignment: MainAxisAlignment.start,
                  defaultBoxSize: Get.width / 8.0,
                  margin: 9,
                  selectedBoxSize: Get.width / 8.0,
                  textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Spartan',
                      fontStyle: FontStyle.normal),
                  defaultDecoration: _pinPutDecoration.copyWith(boxShadow: [
                    const BoxShadow(
                      color: BaseColors.whiteBg,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ], color: BaseColors.white),
                  selectedDecoration: _pinPutDecoration,
                  onChange: (code) {
                    setState(() {
                      textEditingController.value;
                    });
                  }),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    // style: TextStyle(color: Colors.black, fontSize: 36),
                    children: <InlineSpan>[
                      const TextSpan(
                        text: BaseStrings.didntReceiveTheOtp,
                        style: TextStyle(color: BaseColors.black),
                      ),
                      const WidgetSpan(
                        child: SizedBox(
                          width: 5,
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: BaseStrings.resend,
                        style: TextStyle(
                            color: BaseColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              30.toVSB,
              CustomRaisedButton(
                width: Get.width,
                bgBorderColor: Colors.transparent,
                bgColor: BaseColors.black,
                border: 10,
                onTap: () {
                  signupScreenController.confirmSignUp();
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
                    BaseStrings.verify,
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
