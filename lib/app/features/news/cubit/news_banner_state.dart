import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sports_club_flutter/app/models/banner_item_model.dart';

part 'news_banner_state.freezed.dart';

@freezed
class NewsBannerState with _$NewsBannerState {
  const factory NewsBannerState({
    @Default([]) List<BannerItem> bannerItems,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _NewsBannerState;
}