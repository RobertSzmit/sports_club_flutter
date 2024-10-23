import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sports_club_flutter/app/models/schedule_item_model.dart';

part 'schedule_state.freezed.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState({
    @Default([]) List<ScheduleItem> schedules,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _ScheduleState;
}