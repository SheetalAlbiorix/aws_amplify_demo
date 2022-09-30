import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_ui_component/amplifyconfiguration.dart';
import 'package:amplify_ui_component/app/modules/Loading/loading_screen.dart';
import 'package:amplify_ui_component/app/modules/SignInNew/signIn_screen.dart';
import 'package:amplify_ui_component/app/modules/SuccessSignIn/successful_screen.dart';
import 'package:amplify_ui_component/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // amplify plugins

  var _isAmplifyConfigured = false.obs;

  @override
  initState() {
    super.initState();
    _initAmplifyFlutter();
  }

  void _initAmplifyFlutter() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      print('Successfully configured');
    } on Exception catch (e) {
      print('Error configuring Amplify: $e');
    }

    _isAmplifyConfigured.value = true;
  }

  Widget _display() {
    if (_isAmplifyConfigured.value) {
      return SignInScreen();
      //LandingPage();
    } else {
      return LoadingPage();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      // Authenticator(
      // authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
      //   const padding =
      //       EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 16);
      //   switch (state.currentStep) {
      //     case AuthenticatorStep.signIn:
      //       return Scaffold(
      //         body: Padding(
      //           padding: padding,
      //           child: SingleChildScrollView(
      //             child: Column(
      //               children: [
      //                 // app logo
      //                 const Center(child: FlutterLogo(size: 100)),
      //                 // prebuilt sign in form from amplify_authenticator package
      //                 SignInForm(),
      //               ],
      //             ),
      //           ),
      //         ),
      //         // custom button to take the user to sign up
      //         persistentFooterButtons: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               const Text('Don\'t have an account?'),
      //               TextButton(
      //                 onPressed: () => state.changeStep(
      //                   AuthenticatorStep.signUp,
      //                 ),
      //                 child: const Text('Sign Up'),
      //               ),
      //             ],
      //           ),
      //         ],
      //       );
      //     case AuthenticatorStep.signUp:
      //       return Scaffold(
      //         body: Padding(
      //           padding: EdgeInsets.all(10),
      //           child: SingleChildScrollView(
      //             child: Column(
      //               children: [
      //                 // app logo
      //                 const Center(child: FlutterLogo(size: 100)),
      //                 // prebuilt sign up form from amplify_authenticator package
      //                 SignUpForm(),
      //               ],
      //             ),
      //           ),
      //         ),
      //         // custom button to take the user to sign in
      //         persistentFooterButtons: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               const Text('Already have an account?'),
      //               TextButton(
      //                 onPressed: () => state.changeStep(
      //                   AuthenticatorStep.signIn,
      //                 ),
      //                 child: const Text('Sign In'),
      //               ),
      //             ],
      //           ),
      //         ],
      //       );
      //     default:
      //       // returning null defaults to the prebuilt authenticator for all other steps
      //       return null;
      //   }
      // },
    //  child:
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Amplify App',
       //builder: Authenticator.builder(),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        getPages: AppPages.pages,
        home:
        // const Scaffold(
        //   body: Center(
        //     child: Text('You are logged in!'),
        //   ),
        // ),
        _display()
      );
   // );
  }
}
