part of controller;

class SignInScreenController extends GetxController {
  final signInFormKey = GlobalKey<FormState>();

  // RxString nameController = RxString('');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var checkBoxBool = true.obs;
  var rememberMeCheckBox = false.obs;
  RxString signInError = ''.obs;
  String _signUpError = "";

  /*RxString passError = ''.obs;*/
  void _signIn() async {
    // Sign out before in case a user is already signed in
    // If a user is already signed in - Amplify.Auth.signIn will throw an exception
    try {
      await Amplify.Auth.signOut();
    } on PlatformException catch (e) {
      print(e.code);
    }

    try {
      await Amplify.Auth.signIn(
          username: emailController.text.trim(),
          password: passwordController.text.trim());
      Get.to(ForgotPassword());
    } on PlatformException catch (e) {
      _signUpError = e.code;
      print(e.code);
    }
  }

  submit() async {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      return Get.snackbar(
        backgroundColor: BaseColors.darkGrey,
        colorText: BaseColors.white,
        "Error",
        "Please check your email and password",
        snackPosition: SnackPosition.TOP,
      );
    } else if (emailController.text.isEmpty &&
        passwordController.text.isNotEmpty) {
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
        backgroundColor: BaseColors.darkGrey,
        colorText: BaseColors.white,
        "Error",
        "Please check your Pasword",
        snackPosition: SnackPosition.TOP,
      );
    } else if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return _signIn();
    } else {
      // Get.back();
    }
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
