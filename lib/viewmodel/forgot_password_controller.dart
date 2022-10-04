part of controller;

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final codeController = TextEditingController();
  var emailCorrectBool = true.obs;
  RxBool isPasswordReset = false.obs;
  RxString signUpError = "".obs;

  void resetPassword() async {
    try {
      ResetPasswordResult res = await Amplify.Auth.resetPassword(
        username: emailController.text.trim(),
      );
      isPasswordReset.value = true;
      Get.to(ResetPassword());
    } on PlatformException catch (e) {
      signUpError.value = e.code;

      // _signUpExceptions.clear();
      /* e.exceptionList.forEach((el) {
        _signUpExceptions.add(el.exception);
      });*/

    }
  }

  confirmPasswordReset() async {
    try {
      await Amplify.Auth.confirmResetPassword(
        username: emailController.text.trim(),
        newPassword: passwordController.text.trim(),
        confirmationCode: codeController.text.trim(),
      );
      Get.to(const SentEmail());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      /* setError(e);*/
    }
  }
}
