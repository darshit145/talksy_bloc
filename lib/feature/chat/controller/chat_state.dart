part of 'chat_bloc.dart';

@immutable
sealed class ChatState {
  UserMessage? userMessage;
  ChatState(this.userMessage);
}

final class ChatInitial extends ChatState {
  ChatInitial(super.userMessage);
}
