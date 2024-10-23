import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sports_club_flutter/app/models/table_item_model.dart';

part 'table_state.freezed.dart';

@freezed
class TableState with _$TableState {
  const factory TableState({
    @Default([]) List<TableItem> teams,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _TableState;
}