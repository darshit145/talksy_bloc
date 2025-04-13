import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talksy_app/common/common_obj.dart';
import 'package:talksy_app/common/request_handler.dart';
import 'package:talksy_app/feature/chat/domain/model/user_message.dart';
import 'package:talksy_app/util/string_const.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial(null)) {
    on<SendMessage>(_sendMessage);
    on<GetAllMessage>(_getAllThe);
  }
  Future<void> _sendMessage(SendMessage event, Emitter<ChatState> emit) async {
    String responce=await RequestHandler.makePostRequest(StringConst.baseUrl+StringConst.sendMessage,{
      "msg":event.msg,
      "from":event.from,
      "to":event.to,
      "dateSendingTime":event.dateSendingTime,
      "day":event.day
    });
    print(responce);
  }
  Future<void> _getAllThe(GetAllMessage event, Emitter<ChatState> emit)async{
    String responce=await RequestHandler.makeAnGetRequest(StringConst.baseUrl+StringConst.getAllTheUnreadedMsg+CommonObj.loginModel!.newUser.id);
    if(responce!=StringConst.ERROR){
      UserMessage userMessage=userMessageFromJson(responce);
      emit(ChatInitial(userMessage));
    }
    print(responce);
  }
}
