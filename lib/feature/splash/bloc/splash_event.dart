part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}
final class InitSplash extends SplashEvent{
  BuildContext context;
  SharedPreferences pref;
  InitSplash({required this.context,required this.pref});
}
