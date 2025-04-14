import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talksy_app/common/common_obj.dart';
import 'package:talksy_app/common/request_handler.dart';
import 'package:talksy_app/util/string_const.dart';

import '../../chat/controller/chat_bloc.dart';
import '../domain/model/list_user.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(userList: [])) {
    on<ListImpUser>(_listImpUser);
    on<List10Users>(_list10Users);
  }

  Future<void> _listImpUser(ListImpUser event, Emitter<HomeState> emit) async {
    ChatBloc chatBloc=ChatBloc();
    chatBloc.add(GetAllMessage());
    String value = await RequestHandler.makeAnGetRequest(StringConst.baseUrl +
        StringConst.listImpUser +
        CommonObj.loginModel!.newUser.id);
     if (value != StringConst.ERROR) {
      Map<String, dynamic> data = jsonDecode(value);
      List<User> userList = List.generate(
          data["users"].length, (index) => User.fromJson(data["users"][index]));
      onlyImpUser=userList.map((e) => e.id).toList();
      emit(HomeInitial(userList: userList));
    } else {
      print("object");
      add(List10Users());
    }
  }

  Future<void> _list10Users(List10Users event, Emitter<HomeState> emit) async {

    String value = await RequestHandler.makeAnGetRequest(
        StringConst.baseUrl + StringConst.list10Users + noOfPage.toString());
    if (value != StringConst.ERROR && !isLastPage) {
      Map<String, dynamic> data = jsonDecode(value);
      if (data["totalPages"] == noOfPage) {
        isLastPage = true;
      }
      noOfPage = noOfPage + 1;
      List<User> userList = List.from(state.userList);
      List<User> tenUserList=List.generate(data["users"].length,
              (index) => User.fromJson(data["users"][index]));
      tenUserList.removeWhere((element) {
        if (onlyImpUser.contains(element.id)) {
          onlyImpUser.remove(element.id);
          return true;
        }
        return element.id == CommonObj.loginModel!.newUser.id;
      },);
     userList.addAll(tenUserList);
      emit(HomeInitial(userList: userList));
    } else {
      print(state.userList.length);
      print("Last Page no:$noOfPage ");
    }
  }

  List<String> onlyImpUser = [];
  bool isLastPage = false;
  int noOfPage = 1;
}
