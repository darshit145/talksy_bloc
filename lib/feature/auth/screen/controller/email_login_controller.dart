import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy_app/common/common_obj.dart';
import 'package:talksy_app/common/request_handler.dart';
import 'package:talksy_app/feature/auth/model/login_model.dart';
import 'package:talksy_app/util/app_constantSP.dart';
import 'package:talksy_app/util/string_const.dart';

import '../../../../main.dart';
import '../login_screen.dart';
import 'google_auth.dart';

Future<void> loginViaGmail(BuildContext context) async {
  // PermitionHandler;
  // Either the permission was already granted before or the user just granted it.
  final AuthService authService = AuthService();
  await authService.logOut();
  final UserCredential? userCredential = await authService.signInWithGoogle();
  if (userCredential != null) {
    ///Make API CALL GET The DATA Store it IN LOCAL device GO to the Home Page
    ///API request [USER name,email,image]
    ///IN API request 1 cheack that USER alread EXist or not
    ///Set the SharedPreferances NO LOGIN screen
    //THis Becomes True When The Api Response Get Success
    // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomeScreen(), ));
    SharedPreferences sp = await SharedPreferences.getInstance();
    RequestHandler.makePostRequest(StringConst.baseUrl + StringConst.loginUrl, {
      "u_email": userCredential.user?.email,
      "u_name": userCredential.user?.displayName,
      "u_photo": userCredential.user?.photoURL,
      "u_messaging": "Your Bio Hear"
    }).then(
      (value) {
        if (value == StringConst.ERROR) {
          showCupertinoSnackbar("Something Went Wrong");
        } else {
          sp.setBool(AppConstSP.loginStatus, false);
          sp.setString(AppConstSP.userLoginRes, value);
          CommonObj.loginModel = userFromJson(value);
          Navigator.pushReplacementNamed(Get.context, StringConst.routHomePage);
        }
      },
    );

  }
}
