import 'package:firebase_auth/firebase_auth.dart';

class HomeItemModel {
  final int currentIndex;
  final User user;

  HomeItemModel({
    required this.currentIndex,
    required this.user,
  });

  HomeItemModel copyWith({
    int? currentIndex,
    User? user,
  }) {
    return HomeItemModel(
      currentIndex: currentIndex ?? this.currentIndex,
      user: user ?? this.user,
    );
  }
}