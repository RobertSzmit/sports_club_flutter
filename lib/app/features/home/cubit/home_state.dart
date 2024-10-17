part of 'home_cubit.dart';

@immutable
class HomeState {
  final HomeItemModel homeItem;
  final bool isLoading;
  final String errorMessage;

  const HomeState({
    required this.homeItem,
    required this.isLoading,
    required this.errorMessage,
  });

  HomeState copyWith({
    HomeItemModel? homeItem,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      homeItem: homeItem ?? this.homeItem,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}