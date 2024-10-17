import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_club_flutter/app/features/home/home_page.dart';
import 'package:sports_club_flutter/app/features/login/login_page.dart';
import 'package:sports_club_flutter/app/features/my_app/cubit/root_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return MaterialApp(
            title: state.myAppItem.appTitle,
            theme: state.myAppItem.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const RootPage(),
          );
        },
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state.myAppItem.user == null) {
          return const LoginPage();
        }
        return HomePage(user: state.myAppItem.user!);
      },
    );
  }
}