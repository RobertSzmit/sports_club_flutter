import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_club_flutter/app/models/news_item_model.dart';
import 'package:sports_club_flutter/app/repositories/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _repository;

  NewsCubit(this._repository)
      : super(const NewsState(newsItems: [], isLoading: false, errorMessage: ''));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(state.copyWith(isLoading: true));
    _streamSubscription = _repository.streamNewsItems().listen(
      (newsItems) {
        emit(state.copyWith(newsItems: newsItems, isLoading: false));
      },
      onError: (error) {
        emit(state.copyWith(errorMessage: error.toString(), isLoading: false));
      },
    );
  }

  Future<void> loadNewsDetails(String newsId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final newsItem = await _repository.getNewsDetails(newsId);
      final updatedItems = List<NewsItem>.from(state.newsItems);
      final index = updatedItems.indexWhere((item) => item.id == newsId);
      if (index != -1) {
        updatedItems[index] = newsItem;
      } else {
        updatedItems.add(newsItem);
      }
      emit(state.copyWith(newsItems: updatedItems, isLoading: false));
    } catch (error) {
      emit(state.copyWith(errorMessage: error.toString(), isLoading: false));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}