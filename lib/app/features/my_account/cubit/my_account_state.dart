import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sports_club_flutter/app/models/user_item_model.dart';

part 'my_account_state.freezed.dart';

@freezed
class MyAccountState with _$MyAccountState {
  const factory MyAccountState({
    UserItem? userItem,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _MyAccountState;
}