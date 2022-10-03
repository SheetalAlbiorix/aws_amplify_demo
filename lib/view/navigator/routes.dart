import 'package:get/get.dart';

import '../ui/confirmation_otp_code_screen.dart';
import '../ui/resetpassword.dart';
import '../ui/screens.dart';
import '../utils/base_constant/base_constants.dart';

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: BaseRoute.splash,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: BaseRoute.onBoarding,
        page: () => OnBoardingPage(),
      ),
      GetPage(
        name: BaseRoute.homePage,
        page: () => SignInScreen(),
      ),
      GetPage(
        name: BaseRoute.forgotPassword,
        page: () => ForgotPassword(),
      ),
      GetPage(
        name: BaseRoute.resetPageScreen,
        page: () => ResetPassword(),
      ),
      GetPage(
        name: BaseRoute.confirmationOtpCode,
        page: () => ConfirmationOtpCode(),
      ),
      GetPage(
        name: BaseRoute.signupScreen,
        page: () => SignUpScreen(),
      ),
      GetPage(
        name: BaseRoute.accountCreated,
        page: () => const AccountCreated(),
      ),
      GetPage(
        name: BaseRoute.verifyPhoneNumber,
        page: () => VerifyPhoneNumber(),
      ),
    ];
  }
}
