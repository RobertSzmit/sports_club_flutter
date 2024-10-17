import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:sports_club_flutter/app/models/home_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(User user) 
      : super(HomeState(
          homeItem: HomeItemModel(currentIndex: 0, user: user),
          isLoading: false,
          errorMessage: '',
        ));

  void changeIndex(int newIndex) {
    emit(state.copyWith(
      homeItem: state.homeItem.copyWith(currentIndex: newIndex),
    ));
  }
}