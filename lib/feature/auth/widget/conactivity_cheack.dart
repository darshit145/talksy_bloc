import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/font_family.dart';

class ConactivityCheack{
 static  Future<bool> checkConnectivity(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showCupertinoSnackbar(context, "No internet connection!");
      return false;
    }else{
      return true;
    }
  }
  static void showCupertinoSnackbar(BuildContext context, String message) {
    final snackbar = CupertinoPopupSurface(
      isSurfacePainted: true,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white,fontFamily: FontFamily.robotoSimple),
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 2),
        content: snackbar,
      ),
    );
  }

}