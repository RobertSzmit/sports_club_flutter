import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sports_club_flutter/app/models/login_item_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    LoginItem? user,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default(false) bool isCreateAccount,
  }) = _LoginState;
}