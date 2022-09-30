
import 'package:amplify_ui_component/app/modules/SignInNew/signIn_screen.dart';
import 'package:amplify_ui_component/app/modules/SuccessSignIn/successful_screen.dart';
import 'package:amplify_ui_component/loading.dart';

import 'package:get/get.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

 class AppPages {
  static final pages = [
   GetPage(
      name: Routes.SIGNIN,
      page: () => SignInScreen(),
    //  binding: dashboardBinding(),
    ),
    GetPage(
      name: Routes.SUCCESS,
      page: () => SuccessScreen(),
      //  binding: dashboardBinding(),
    ),
    GetPage(
      name: Routes.LOADING,
      page: () => LoadingScreen(),
      //  binding: dashboardBinding(),
    ),
  ];
}