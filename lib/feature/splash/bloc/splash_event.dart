part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}
final class InitSplash extends SplashEvent{
  BuildContext context;
  InitSplash({required this.context});
}
