import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy_app/common/request_handler.dart';
import 'package:talksy_app/util/app_constantSP.dart';
import 'package:talksy_app/util/string_const.dart';

Future<void> loginViaGmail(BuildContext context)async{
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
    RequestHandler.makePostRequest(StringConst.baseUrl+StringConst.loginUrl,{"u_email":"dfachara20@gmail.com","u_name":"sdgsdfs","u_photo":"dfsdf","u_messaging":"sdfsdfsh"});
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setBool(AppConstSP.loginStatus,true);
  }

}
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }


  Future<void> logOut() async {
    try {
      await _googleSignIn.signOut(); // Sign out from Google
      await _auth.signOut(); // Sign out from Firebase
    } catch (e) {
      print("Error logging out: $e");
    }
  }

}