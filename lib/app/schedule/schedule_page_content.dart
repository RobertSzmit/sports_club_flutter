import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_club_flutter/app/schedule/cubit/schedule_cubit.dart';
import 'package:sports_club_flutter/app/schedule/schedule_page_view.dart';

class SchedulePageContent extends StatelessWidget {
  const SchedulePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleCubit()..start(),
      child: const SchedulePageView(),
    );
  }
}
