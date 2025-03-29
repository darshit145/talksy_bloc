import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/material_button.dart';
import '../../../util/app_constantSP.dart';
import '../../../util/font_family.dart';
import '../../../util/images.dart';
import '../../../util/string_const.dart';

class OnboardingScreen3 extends StatelessWidget {
  final PageController pageController;
  final SharedPreferences sharedPreferences;
  const OnboardingScreen3({super.key,required this.sharedPreferences, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  Images.shildIcon,
                  height: 60,
                  width: 60,
                ),
                Container(
                  height: 192,
                  width: 192,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Images.onboarding_3),
                          fit: BoxFit.fill)),
                ),
                Text(
                  "Your Privacy Matters",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: FontFamily.roboto),
                ),
                Text(
                  "Industry-leading security with end-to-end\nencryption keeps your conversations private and\nsecure",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: FontFamily.roboto),
                  textAlign: TextAlign.center,
                ),
                Container(
                  // height: 300,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  // color: Colors.red,
                  child: 
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getColumnElement(imgPath: Images.lockIcon, title: "End-to-End Encryption"),
                          getColumnElement(imgPath: Images.userShild, title: "Two-Factor Auth"),

                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getColumnElement(imgPath: Images.fingureprintIcon, title: "Biometric Lock"),
                          getColumnElement(imgPath: Images.messageTimer, title: "Message Timer"),

                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.grey,
                    ),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.grey,
                    ),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.black,
                    ),

                  ],
                ),
                MaterialButtonView(
                  text: "Next",
                  callbackAction: () {
                    sharedPreferences.setBool(AppConstSP.onBoardingNavigation, false);
                      Navigator.pushReplacementNamed(context, StringConst.routAuthScreen);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget getColumnElement({required String imgPath, required String title}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(imgPath,width: 36,height: 36,),
        SizedBox(height: 3,),
        Text(title,
          style:TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: FontFamily.roboto) ,
        )
      ],
    );
  }
}
