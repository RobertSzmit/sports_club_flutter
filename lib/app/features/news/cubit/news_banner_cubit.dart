import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_club_flutter/app/models/banner_item_mode.dart';
import 'package:sports_club_flutter/app/repositories/news_repository.dart';

part 'news_banner_state.dart';

class NewsBannerCubit extends Cubit<NewsBannerState> {
  final NewsRepository _repository;

  NewsBannerCubit(this._repository)
      : super(
          const NewsBannerState(
            bannerItems: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const NewsBannerState(
        bannerItems: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = _repository.streamBannerItems().listen(
      (bannerItems) {
        emit(
          NewsBannerState(
            bannerItems: bannerItems,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
      onError: (error) {
        emit(
          NewsBannerState(
            bannerItems: [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
