import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talksy_app/get_it.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../util/font_family.dart';
import '../../../util/images.dart';
import '../../../util/string_const.dart';
import '../bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.microtask(
      () => context.read<SplashBloc>().add(
            InitSplash(context: context, pref: it()),
          ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              Images.splashBackground,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0xFF0189BD)],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                WidgetAnimator(
                  // incomingEffect: WidgetTransitionEffects.defaultDuration(),
                  atRestEffect: WidgetRestingEffects.bounce(),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(Images.appLogo))),
                  ),
                ),
                Text(
                  StringConst.appName,
                  style: TextStyle(
                      fontFamily: FontFamily.schyler,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                Text(
                  StringConst.splashTagLine_1,
                  style: TextStyle(
                      fontFamily: FontFamily.robotoSimple,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  StringConst.splashTagLine_2,
                  style: TextStyle(
                      fontFamily: FontFamily.robotoSimple,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Text(
                "Version 1.0.0",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
