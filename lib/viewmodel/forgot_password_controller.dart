part of controller;

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  var emailCorrectBool = true.obs;

  RxBool isPasswordReset = false.obs;
  RxString signUpError = "".obs;

  void resetPassword() async {
    try {
      ResetPasswordResult res = await Amplify.Auth.resetPassword(
        username: emailController.text.trim(),
      );
      isPasswordReset.value = true;
      Get.to(const ResetPassword());
    } on PlatformException catch (e) {
      signUpError.value = e.code;

      // _signUpExceptions.clear();
      /* e.exceptionList.forEach((el) {
        _signUpExceptions.add(el.exception);
      });*/

    }
  }
}
