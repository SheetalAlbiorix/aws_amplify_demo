part of helpers;

class SharedData {
  String? imageFle;

  static checkIfAlreadyLogin() async {
    final prefs = await SharedPreferences.getInstance();

    // bool? newUser;
    bool? remember;
    String? emailAddress;
    String? password;

    emailAddress = (prefs.getString('emailAddress') ?? emailAddress);
    password = (prefs.getString('password') ?? password);
    // newUser = (prefs.getBool('login') ?? false);
    remember = (prefs.getBool('remember_me') ?? remember);
    print(emailAddress);
    print(password);
    // print(newUser);
    print(remember);
    if (remember == false) {
      Get.to(() => SignInScreen());
    } else {
      Get.to(() => NextScreen());
    }
/*    if (newUser == false || remember == false) {
      // Get.to(SignInScreen());
      Get.to(() =>  NextScreen());
    } else if (newUser == false || remember == true) {
      Get.to(() => SignInScreen());
    } else {
      // Get.to(const Dashboard());
      Get.to(() =>  NextScreen());
    }*/
  }

  static saveData(String emailAddress, String password, bool remember) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', true);
    prefs.setString('emailAddress', emailAddress);
    prefs.setString('password', password);
    prefs.setBool("remember_me", remember);

    // Get.to(() => const Dashboard());
  }

  static saveImage(imageFle) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('photo_image', imageFle);
  }

  void loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    imageFle = (prefs.getString('photo_image') ?? imageFle);
  }
}