part of 'root_cubit.dart';

@immutable
class RootState {
  final MyAppItemModel myAppItem;
  final bool isLoading;
  final String errorMessage;

  const RootState({
    required this.myAppItem,
    required this.isLoading,
    required this.errorMessage,
  });

  RootState copyWith({
    MyAppItemModel? myAppItem,
    bool? isLoading,
    String? errorMessage,
  }) {
    return RootState(
      myAppItem: myAppItem ?? this.myAppItem,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}