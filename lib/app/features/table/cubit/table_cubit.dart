import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_club_flutter/app/models/table_item_model.dart';
import 'package:sports_club_flutter/app/repositories/table_repository.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  final TableRepository _repository;

  TableCubit(this._repository)
      : super(
          const TableState(
            teams: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const TableState(
        teams: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = _repository.streamTableItems().listen(
      (tableItems) {
        emit(
          TableState(
            teams: tableItems,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
      onError: (error) {
        emit(
          TableState(
            teams: const [],
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