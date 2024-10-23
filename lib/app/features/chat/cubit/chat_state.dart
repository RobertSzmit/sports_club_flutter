import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sports_club_flutter/app/models/chat_item_model.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatItem> messages,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _ChatState;
}