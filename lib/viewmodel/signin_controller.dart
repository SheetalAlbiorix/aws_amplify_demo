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
      /*  await Amplify.Auth.signIn(
          username: emailController.text.trim(),
          password: passwordController.text.trim());*/
      await getLogin();
      // Get.to(NextScreen());
    } on PlatformException catch (e) {
      _signUpError = e.code;
      print(e.code);
    }
  }

  getLogin() async {
    String username = emailController.text;
    String password = passwordController.text;
    bool remember = rememberMeCheckBox.value;
    var matchedUser = await Amplify.Auth.signIn(
        username: emailController.text.trim(),
        password: passwordController.text.trim());
    if (matchedUser == null) {
      return Get.defaultDialog(
          title: BaseStrings.send,
          middleText: BaseStrings.password,
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            ElevatedButton(
              child: Text(BaseStrings.start),
              onPressed: () {
                Get.back();
              },
            ),
          ],
          backgroundColor: Colors.teal,
          titleStyle: const TextStyle(color: Colors.white),
          // middleTextStyle: TextStyle(color: Colors.white),
          radius: 30);
    } else {
      if (username != '' && password != '' && remember != '') {
        SharedData.saveData(username, password, remember);
      }
      Get.to(NextScreen());
    }
  }

  void fetchAuthSession() async {
    try {
      final result = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: true),
      );
      String identityId = (result as CognitoAuthSession).identityId!;
      safePrint('identityId: $identityId');
    } on AuthException catch (e) {
      safePrint(e.message);
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