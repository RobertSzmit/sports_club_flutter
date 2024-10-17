import 'package:firebase_auth/firebase_auth.dart';

class MyAppItemModel {
  final User? user;
  final String appTitle;
  final bool isDarkMode;

  MyAppItemModel({
    this.user,
    required this.appTitle,
    required this.isDarkMode,
  });

  MyAppItemModel copyWith({
    User? user,
    String? appTitle,
    bool? isDarkMode,
  }) {
    return MyAppItemModel(
      user: user ?? this.user,
      appTitle: appTitle ?? this.appTitle,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}