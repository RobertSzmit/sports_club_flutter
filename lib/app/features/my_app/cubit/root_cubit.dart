import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:sports_club_flutter/app/models/my_app_item_model.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit()
      : super(
          RootState(
            myAppItem: MyAppItemModel(
              user: null,
              appTitle: 'Flutter Demo',
              isDarkMode: true,
            ),
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> start() async {
    emit(state.copyWith(isLoading: true));

    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(
        state.copyWith(
          myAppItem: state.myAppItem.copyWith(user: user),
          isLoading: false,
        ),
      );
    })
      ..onError((error) {
        emit(
          state.copyWith(
            myAppItem: state.myAppItem.copyWith(user: null),
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  void toggleTheme() {
    emit(
      state.copyWith(
        myAppItem: state.myAppItem.copyWith(isDarkMode: !state.myAppItem.isDarkMode),
      ),
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}