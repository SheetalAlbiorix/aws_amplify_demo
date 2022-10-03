import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_ui_component/amplifyconfiguration.dart';
import 'package:amplify_ui_component/app/modules/Loading/loading_screen.dart';
import 'package:amplify_ui_component/app/modules/SignInNew/logic.dart';
import 'package:amplify_ui_component/app/modules/SignInNew/signIn_screen.dart';
import 'package:amplify_ui_component/app/modules/SuccessSignIn/successful_screen.dart';
import 'package:amplify_ui_component/app/routes/app_pages.dart';
import 'package:amplify_ui_component/app/theme/app_colors.dart';
import 'package:amplify_ui_component/app/utils/base_constant/base_constants.dart';
import 'package:amplify_ui_component/app/utils/helper/size_configs.dart';
import 'package:amplify_ui_component/app/utils/widgets/custom_button.dart';
import 'package:amplify_ui_component/app/utils/widgets/custom_text_field.dart';
import 'package:amplify_ui_component/app/utils/widgets/text_view.dart';
import 'package:flutter/gestures.dart';
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
    final SignInScreenController signInScreenController = Get.put(SignInScreenController());

    return Authenticator(
        authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
          //const padding = EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 16);
          switch (state.currentStep) {
            case AuthenticatorStep.signIn:
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  leading: InkWell(
                    onTap: () {
                      // Get.back();
                    },
                    child:  Icon(
                      size: 14,
                      color: nuetral,
                      Icons.arrow_back_ios,
                    ),
                  ),
                  centerTitle: true,
                  title:  Text(
                      "SIGN In",
                      style:TextStyle(
                        color: nuetral,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Spartan',
                        //: TextAlign.center,
                        fontStyle: FontStyle.normal,
                      )

                  ),
                  elevation: 0.0,
                ),
                body: Container(
                  height: Get.height,
                 width: Get.width,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(BaseAssets.signInBackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Form(
                    key: signInScreenController.signInFormKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                BaseAssets.logo,
                                width: 117.w,
                                height: 82.h,
                              ),
                            ),
                            10.toVSB,
                            TextView(
                              BaseStrings.welcomeBack,
                              color: nuetral,
                              fontSize: 32,
                              fontFamily: 'Spartan',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                            ),
                            8.toVSB,
                            Text(BaseStrings.signInToContinue,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: nuetral,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                ),
                                softWrap: false,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                            26.toVSB,
                            // Obx(
                            //       () => CustomTextFormField(
                            //     suffixIcon: Visibility(
                            //       visible: signInScreenController.checkBoxBool.value ==
                            //           false,
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: Image.asset(
                            //           BaseAssets.check,
                            //           width: 10.w,
                            //           height: 7.h,
                            //         ),
                            //       ),
                            //     ),
                            //     /*  signInScreenController.checkBoxBool.value ==
                            //               false
                            //           ? Image.asset(
                            //               BaseAssets.check,
                            //               width: 10.w,
                            //               height: 10.h,
                            //             )
                            //           : const Icon(
                            //               Icons.error,
                            //               color: Colors.red,
                            //             ),*/
                            //     isPassword: false,
                            //     textInputAction: TextInputAction.next,
                            //     onChanged: validateEmail,
                            //     textEditingController:
                            //     signInScreenController.emailController,
                            //     /* bgColor: Colors.white,*/
                            //     border: 10,
                            //     labelText: BaseStrings.email,
                            //   ),
                            // ),
                            SignUpForm.custom(
                              fields: [
                                SignUpFormField.username(),
                                // SignUpFormField.email(required: true),
                                // SignUpFormField.custom(
                                //
                                //   required: true,
                                //   validator: ((value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'You must provide a website';
                                //     }
                                //     if (!value.contains('example.com')) {
                                //       return 'Your website must be have a domain of example.com';
                                //     }
                                //     return null;
                                //   }),
                                //   title: 'Website',
                                //   attributeKey: CognitoUserAttributeKey.website,
                                // ),
                                // SignUpFormField.custom(
                                //   title: 'Bio',
                                //   attributeKey: const CognitoUserAttributeKey.custom('bio'),
                                // ),
                                SignUpFormField.password(),
                              //  SignUpFormField.passwordConfirmation(),
                              ],
                            ),
                            15.toVSB,
                      //       CustomTextFormField(
                      //         isPassword: true,
                      //         obscureText: true,
                      //         textInputAction: TextInputAction.next,
                      //         onChanged: validatePasswordLength,
                      //         /*  onChanged: validatePasswordLength,
                      // validator: validatePasswordLength,*/
                      //         textEditingController:
                      //         signInScreenController.passwordController,
                      //         // bgColor: Colors.white,
                      //         border: 10,
                      //         // bgBorderColor: Colors.grey,
                      //         labelText: BaseStrings.password,
                      //       ),



                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Obx(
                                                  () => Checkbox(
                                                  visualDensity: const VisualDensity(
                                                      horizontal: -4, vertical: -4),
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(5.0))),
                                                  activeColor: BaseColors.black,
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Theme.of(context)
                                                          .unselectedWidgetColor),
                                                  // Rounded Checkbox
                                                  value: signInScreenController
                                                      .rememberMeCheckBox.value,
                                                  onChanged: (value) {
                                                    signInScreenController
                                                        .rememberMeCheckBox.value =
                                                    !signInScreenController
                                                        .rememberMeCheckBox.value;
                                                  }),
                                            ),
                                            TextView(
                                              textAlign: TextAlign.end,
                                              BaseStrings.rememberMe,
                                              fontFamily: 'lato',
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //  Get.to( ForgotPassword());
                                    },
                                    child:  TextView(
                                      BaseStrings.forgotPassword,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            20.toVSB,
                            CustomRaisedButton(
                              width: Get.width,
                              bgBorderColor: Colors.transparent,
                              bgColor: BaseColors.black,
                              border: 10,
                              onTap: () {
                                signInScreenController.signIn();
                                // signInScreenController.submit();
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
                                  BaseStrings.signIn,
                                  // textStyle: BaseStyles.readMoreText,
                                ),
                              ),
                            ),
                            20.toVSB,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  // style: TextStyle(color: Colors.black, fontSize: 36),
                                  children: <InlineSpan>[
                                    const TextSpan(
                                      text: BaseStrings.dontHaveAnAccount,
                                      style: TextStyle(color: BaseColors.black),
                                    ),
                                    const WidgetSpan(
                                      child: SizedBox(
                                        width: 5,
                                      ),
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          //   Get.to(SignInScreen());
                                        },
                                      text: BaseStrings.signUp,
                                      style: const TextStyle(
                                          color: BaseColors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            35.toVSB,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // signInScreenController.signInWithFacebook();
                                  },
                                  child: Image.asset(
                                    BaseAssets.facebook,
                                    height: 80.h,
                                    width: 25.w,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    //  signInScreenController.loginWithTwitter();
                                  },
                                  child: Image.asset(
                                    BaseAssets.twitter,
                                    height: 80.h,
                                    width: 25.w,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    //  _googleSignIn.signIn().then((userData) {},).catchError((e) {},);
                                  },
                                  child: Image.asset(
                                    BaseAssets.google,
                                    height: 80.h,
                                    width: 25.w,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              );
          }
        },
   //   signUpForm: SignUpForm.custom(
   //      fields: [
   //        SignUpFormField.username(),
   //        SignUpFormField.email(required: true),
   //        SignUpFormField.custom(
   //          required: true,
   //          validator: ((value) {
   //            if (value == null || value.isEmpty) {
   //              return 'You must provide a website';
   //            }
   //            if (!value.contains('example.com')) {
   //              return 'Your website must be have a domain of example.com';
   //            }
   //            return null;
   //          }),
   //          title: 'Website',
   //          attributeKey: CognitoUserAttributeKey.website,
   //        ),
   //        SignUpFormField.custom(
   //          title: 'Bio',
   //          attributeKey: const CognitoUserAttributeKey.custom('bio'),
   //        ),
   //        SignUpFormField.password(),
   //        SignUpFormField.passwordConfirmation(),
   //      ],
   //    ),

      // authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
      //   const padding = EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 16);
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
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Amplify App',
          builder: Authenticator.builder(),
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: const TextTheme(
              // text theme of the header on each step
              headline6: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),

            // theme of the form fields for each step
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.all(16),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor:Colors.transparent,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
               // borderSide: BorderSide.,
              ),
            ),
            // theme of the primary button for each step
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(16)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ),
          getPages: AppPages.pages,
          home:
              // const Scaffold(
              //   body: Center(
              //     child: Text('You are logged in!'),
              //   ),
              // ),
              _display()),
    );
  }
}
