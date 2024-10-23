import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_club_flutter/app/models/login_item_model.dart';
import 'package:sports_club_flutter/app/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository)
      : super(const LoginState(
          user: null,
          isLoading: false,
          errorMessage: '',
          isCreateAccount: false,
        ));

  StreamSubscription? _userSubscription;

  Future<void> signIn(String email, String password) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final userCredential = await _loginRepository.signIn(email, password);
      _subscribeToUserChanges(userCredential.user!.uid);
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> signUp(String email, String password, String username) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      await _loginRepository.signUp(email, password, username);
      final userCredential = await _loginRepository.signIn(email, password);
      _subscribeToUserChanges(userCredential.user!.uid);
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: error.toString(),
      ));
    }
  }

  void _subscribeToUserChanges(String userId) {
    _userSubscription?.cancel();
    _userSubscription = _loginRepository.getLoginStream(userId).listen(
      (user) {
        emit(state.copyWith(user: user, isLoading: false));
      },
      onError: (error) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: error.toString(),
        ));
      },
    );
  }

  void toggleCreateAccount() {
    emit(state.copyWith(isCreateAccount: !state.isCreateAccount));
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}