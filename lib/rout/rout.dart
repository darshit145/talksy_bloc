import 'package:flutter/cupertino.dart';

import '../feature/auth/screen/login_screen.dart';
import '../feature/auth/screen/login_screen_mail.dart';
import '../feature/auth/screen/mobile_auth_screen.dart';
import '../feature/auth/screen/registraation_screen.dart';
import '../feature/auth/screen/validation/otp_validation_screen.dart';
import '../feature/home/screen/home_page.dart';
import '../feature/intro/screen/intro_screen.dart';
import '../util/string_const.dart';

Map<String, WidgetBuilder> routes = {
  StringConst.routIntroScreen: (context) => IntroScreen(),
  StringConst.routAuthScreen: (context) => LoginScreen(),
  StringConst.routRegistraationScreen: (context) => RegistraationScreen(),
  // StringConst.routTermAndConditionsScreen: (context) => TermAndConditionsScreen(),
  StringConst.routLoginScreenMail: (context) => LoginScreenMail(),
  StringConst.routMobileAuthScreen: (context) => MobileAuthScreen(),
  StringConst.routOtpValidationScreen: (context) => OtpValidationScreen(),
  StringConst.routHomePage: (context) =>  HomePage(),
  // StringConst.routToVideoCallScreen: (context) =>  VideoCallScreen(),
};
