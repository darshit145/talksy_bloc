import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talksy_app/common/common_obj.dart';
import 'package:talksy_app/common/request_handler.dart';
import 'package:talksy_app/feature/chat/domain/model/user_message.dart';
import 'package:talksy_app/util/string_const.dart';

import '../domain/model/database_helper.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial(null)) {
    on<SendMessage>(_sendMessage);
    on<GetAllMessage>(_getAllThe);
    on<GetOnlySelectedMessage>(_getOnlySelected);
  }
  Future<void> _sendMessage(SendMessage event, Emitter<ChatState> emit) async {
    String responce=await RequestHandler.makePostRequest(StringConst.baseUrl+StringConst.sendMessage,{
      "msg":event.msg,
      "from":event.from,
      "to":event.to,
      "dateSendingTime":event.dateSendingTime,
      "day":event.day
    });
    if(responce==StringConst.ERROR){
      return;
    }
    //  i have to chaeack the Responce and then  mark the Tick
    final DateBaseHelper databaseHelper = DateBaseHelper.instance;
    Message message=Message(id: "id", msg:event.msg, from:event.from, to:event.to, dateSendingTime:event.dateSendingTime, readStatus:0, day:event.day, v:1);
    databaseHelper.insertRecent(message);
    UserMessage? userMessages=state.userMessage;
    userMessages?.messages.add(message);
    emit(ChatInitial(userMessages));
    // state.userMessage.messages.
  }
  Future<void> _getAllThe(GetAllMessage event, Emitter<ChatState> emit)async{
    String responce=await RequestHandler.makeAnGetRequest(StringConst.baseUrl+StringConst.getAllTheUnreadedMsg+CommonObj.loginModel!.newUser.id);
    if(responce!=StringConst.ERROR){
      UserMessage userMessage=userMessageFromJson(responce);
      userMessage.messages.map((event) {
        final DateBaseHelper databaseHelper = DateBaseHelper.instance;
        Message message=Message(id: "id", msg:event.msg, from:event.from, to:event.to, dateSendingTime:event.dateSendingTime, readStatus:0, day:event.day, v:1);
        databaseHelper.insertRecent(message);
      },).toList();

      //i have to chage this Latter
      emit(ChatInitial(userMessage));

    }
    print(responce);
  }

  Future<void> _getOnlySelected(GetOnlySelectedMessage event, Emitter<ChatState> emit)async{
    final DateBaseHelper databaseHelper = DateBaseHelper.instance;
    List<Message> messages=await databaseHelper.getRecent();
    messages.removeWhere((element) {
      if(element.from==event.id||element.to==event.id){
        return false;
      }
      return true;
    },);
    emit(ChatInitial(UserMessage(success: true, messages: messages)));
  }
}
