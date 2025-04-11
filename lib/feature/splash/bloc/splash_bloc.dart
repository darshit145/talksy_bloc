import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy_app/main.dart';
import 'package:talksy_app/util/app_constantSP.dart';

import '../../../util/string_const.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitSplash>(_initSplash);
  }
  Future<void> _initSplash(InitSplash event,Emitter<SplashState> emit)async{
    Future.delayed(Duration(seconds: 2)).then((value) {
      if(event.pref.getBool(AppConstSP.onBoardingNavigation)??true){
        //do not have to show the onboarding page
        Navigator.pushReplacementNamed(Get.context, StringConst.routIntroScreen);
      }else if(event.pref.getBool(AppConstSP.loginStatus)??true){
        Navigator.pushReplacementNamed(Get.context, StringConst.routAuthScreen);
      }else{
        Navigator.pushReplacementNamed(Get.context, StringConst.routHomePage);
      }

    },);
  }
}
