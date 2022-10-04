library controller;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_ui_component/next_screen.dart';
import 'package:amplify_ui_component/view/ui/resetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:twitter_login/twitter_login.dart';

// import 'package:my_village/view/ui/signin_screen.dart';

import '../model/on_boarding_model.dart';
import '../view/ui/confirmation_otp_code_screen.dart';
import '../view/ui/screens.dart';
import '../view/utils/base_constant/base_constants.dart';

part 'forgot_password_controller.dart';
part 'on_boarding_controller.dart';
part 'signin_controller.dart';
part 'signup_controller.dart';
part 'verify_phone_number_controller.dart';
