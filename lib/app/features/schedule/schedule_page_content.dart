import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_club_flutter/app/features/schedule/cubit/schedule_cubit.dart';
import 'package:sports_club_flutter/app/features/schedule/schedule_page_view.dart';
import 'package:sports_club_flutter/app/repositories/schedule_repository.dart';

class SchedulePageContent extends StatelessWidget {
  const SchedulePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleCubit(ScheduleRepository())..start(),
      child: const SchedulePageView(),
    );
  }
}
