part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  List<User> userList=[];
  HomeState({required this.userList});
}

final class HomeInitial extends HomeState {
  HomeInitial({required super.userList});
}
