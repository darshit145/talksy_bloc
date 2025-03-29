import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talksy_app/feature/splash/bloc/splash_bloc.dart';
import 'package:talksy_app/rout/rout.dart';
import 'package:talksy_app/util/string_const.dart';
import 'feature/splash/screen/splash_screen.dart';
import 'get_it.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getIt();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: StringConst.appName,
        home: SplashScreen(),
        routes: routes,
      ),
    );
  }
}

class Get {
  static get context => navigatorKey.currentContext;
  static get currentState => navigatorKey.currentState;
}



//Ndk is a tool which convert the dart code in to the c/c++ language
//according to the processor type (32-bit,64-bit)
//then the NDK generate the .os files ,
//this .os files get tunes when the app is opened by the Android os
//the file runes in the android device but not have the root permition by the android os,

//NDK compiles C/C++ code into .so files, which are loaded by the app and executed by
// the Android OS within the app's sandbox, without root permissions.

//today i have run the project storybook in the IOS platform learn about pod and Xcode,how to change the pod version and can change the Minimum Deployment target


//taday i have Done Some Minor Changes in the App like font and alignment,Specially the Search Functionality
//We are Storing the data from the Notification to the local Device and Show the Story to the User