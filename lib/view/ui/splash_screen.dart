part of screens;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SharedData.checkIfAlreadyLogin();
    /* Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingPage()),
      ),
    );*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(),
        () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(BaseAssets.signInBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    BaseAssets.logo,
                    height: 175.h,
                    width: 125,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
