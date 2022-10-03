part of controller;

class SignupScreenController extends GetxController {
  final signInFormKey = GlobalKey<FormState>();

  // RxString nameController = RxString('');

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();
  final confirmationCodeController = TextEditingController();

  final RxString _signUpError = "".obs;
  bool _isSignedUp = false;
  var checkBoxBool = true.obs;
  var rememberMeCheckBox = false.obs;
  RxString signInError = ''.obs;

  /*RxString passError = ''.obs;*/

  signupSubmit() async {
    if (nameController.text.isEmpty &&
        emailController.text.isEmpty &&
        passwordController.text.isEmpty &&
        conformPasswordController.text.isEmpty) {
      return Get.snackbar(
        backgroundColor: BaseColors.darkGrey,
        colorText: BaseColors.white,
        "Error",
        "Please check all the fields",
        snackPosition: SnackPosition.TOP,
      );
    }
/*    else if (nameController.text.isNotEmpty && emailController.text.isEmpty &&
        passwordController.text.isEmpty && conformPasswordController.text.isEmpty) {
      return Get.snackbar(
        backgroundColor: BaseColors.darkGrey,
        colorText: BaseColors.white,
        "Error",
        "Please check your email",
        snackPosition: SnackPosition.TOP,
      );
    } else if (emailController.text.isNotEmpty &&
        passwordController.text.isEmpty) {
      return Get.snackbar(
        "Error",
        "Please check your Pasword",
        snackPosition: SnackPosition.TOP,
      );
    } else if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty)*/
    else {
      return _signUp();
    }
    /*    Get.snackbar(
        "Done",
        "Successful Login",
        snackPosition: SnackPosition.TOP,
      );*/
    /*  else {
      // Get.back();*/
  }

  void _signUp() async {
    _signUpError.value = "";

    Map<CognitoUserAttributeKey, String> userAttributes = {
      CognitoUserAttributeKey.email: emailController.text,
      CognitoUserAttributeKey.name: nameController.text
    };
    try {
      await Amplify.Auth.signUp(
          username: emailController.text.trim(),
          password: passwordController.text.trim(),
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      _isSignedUp = true;
      Get.to(ConfirmationOtpCode());
    } on PlatformException catch (error) {
      _setError(error);
      print(error);
    }
  }

  confirmSignUp() async {
    _signUpError.value = "";
    try {
      await Amplify.Auth.confirmSignUp(
          username: emailController.text.trim(),
          confirmationCode: confirmationCodeController.text.trim());
      Get.to(NextScreen());
    } on PlatformException catch (error) {
      _setError(error);
      print(error.code);
    }
  }

  void _setError(PlatformException error) {
    _signUpError.value = error.code;
    print(error.code);
  }

  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }

  void loginWithTwitter() async {
    var twitterLogin = TwitterLogin(
      apiKey: 'P0xW6Lg9tnJ1gd6ydD47YOYHK',
      apiSecretKey: 'LZYNEld1pJyqwpclWQ5IG1ydqXScCyIdX0mPDDl9ENEcQD8MqS',
      redirectURI: 'https://my-village-51eec.firebaseapp.com/__/auth/handler',
    );
    final twitterLoginResult = await twitterLogin.loginV2(forceLogin: true);

    switch (twitterLoginResult.status) {
      case TwitterLoginStatus.loggedIn:
        // success
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        break;
      case TwitterLoginStatus.error:
        // error
        break;
    }
  }
/*  submit() async {

    final isValid = signInFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    Get.snackbar(
      "GeeksforGeeks",
      "Hello everyone",
      snackPosition: SnackPosition.BOTTOM,
    );

    signInFormKey.currentState!.save();
  }*/

}
