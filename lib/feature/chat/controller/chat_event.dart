part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}
final class SendMessage extends ChatEvent{
  String msg;
  String from;
  String to;
  String dateSendingTime;
  String day;
  SendMessage({required this.msg,required this.from,required this.to,required this.dateSendingTime,required this.day});
}
final class GetAllMessage extends ChatEvent{
}
final class GetOnlySelectedMessage extends ChatEvent{
  final String id;
  GetOnlySelectedMessage({required this.id});
}