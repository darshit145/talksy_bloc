import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:talksy_app/main.dart';

import '../../../util/string_const.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitSplash>(_initSplash);
  }
  Future<void> _initSplash(InitSplash event,Emitter<SplashState> emit)async{
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacementNamed(Get.context, StringConst.routIntroScreen);
    },);
  }
}
