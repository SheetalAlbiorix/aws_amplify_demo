part of controller;

class SignInScreenController extends GetxController {
  final signInFormKey = GlobalKey<FormState>();
  final LoadingState loadingState = LoadingState();
  // RxString nameController = RxString('');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var checkBoxBool = true.obs;
  var rememberMeCheckBox = false.obs;
  RxString signInError = ''.obs;
  String _signUpError = "";
  var onLoading=false.obs;
  final ProgressService progressService = ProgressService();



  /*RxString passError = ''.obs;*/
  void _signIn() async {
    // Sign out before in case a user is already signed in
    // If a user is already signed in - Amplify.Auth.signIn will throw an exception
    try {
      final SignOutResult res = await Amplify.Auth.signOut();
     //progressService.dismissProgress();
    } on PlatformException catch (e) {
      Get.snackbar(
        e.code.toString(),"Failed",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error, color: Colors.white),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.code);
      progressService.dismissProgress();
    }



    try {

      await Amplify.Auth.signIn(
          username: emailController.text.trim(),
          password: passwordController.text.trim());
      progressService.dismissProgress();
      Get.to(() => NextScreen());

      Get.snackbar(
        "Signed In Successfully","Success",
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
        icon: Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );


    } on AuthException catch (e) {
      _signUpError = e.message.toString();
      Get.snackbar(
       e.message.toString(),"Failed",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      progressService.dismissProgress();
      print(e.message.toString());
    }
  }

  submit() async {
    progressService.showProgress();
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
        "Please check your Password",
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
