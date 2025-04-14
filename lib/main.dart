import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talksy_app/feature/splash/bloc/splash_bloc.dart';
import 'package:talksy_app/rout/rout.dart';
import 'package:talksy_app/util/string_const.dart';
import 'feature/chat/controller/chat_bloc.dart';
import 'feature/home/controller/home_bloc.dart';
import 'feature/splash/screen/splash_screen.dart';
import 'get_it.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getIt();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static const platform = MethodChannel('com.example/exit');

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(_handleMethod);
    WidgetsBinding.instance.addObserver(this);
  }
  Future<void> _handleMethod(MethodCall call) async {
    if (call.method == "onExit") {
      print("Hello");  // Print "Hello" when the app is closing
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    SharedPreferences sp=it();
    print(sp.getString("key"));
    if (state == AppLifecycleState.paused) {
      sp.setString("key"," value");
      print('Hello (App killed)1');
    }
    // if (state == AppLifecycleState.resumed) {
    //   print('Hello (App killed)12');
    // }
    // if (state == AppLifecycleState.inactive) {
    //   print('Hello (App killed)123');
    // }
    // if (state == AppLifecycleState.hidden) {
    //   print('Hello (App killed)1234');
    // }
    // if (state == AppLifecycleState.paused) {
    //   print('Hello (App killed)12345');
    // }
    if (state == AppLifecycleState.values) {
      sp.setString("key"," value");
      print('Hello (App killed)123456');
    }
    if (state == AppExitResponse.cancel) {
      sp.setString("key"," value");
      print('Hello (App killed)1234567');
    }
    if (state == AppExitResponse.exit) {
      sp.setString("key"," value");
      print('Hello (App killed)1233458');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ChatBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(secondaryHeaderColor: Color(0xFF22C55E)),
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

//this is the minor changes fron the A
//this change is done by the Darshit

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

