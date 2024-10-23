import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_club_flutter/app/features/my_app/app.dart';
import 'package:sports_club_flutter/app/features/my_app/cubit/root_cubit.dart';
import 'package:sports_club_flutter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(
    BlocProvider(
      create: (context) => RootCubit(),
      child: const MyApp(),
    ),
  );
}