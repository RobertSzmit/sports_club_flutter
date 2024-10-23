import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_club_flutter/app/features/table/cubit/table_cubit.dart';
import 'package:sports_club_flutter/app/features/table/table_page_view.dart';
import 'package:sports_club_flutter/app/repositories/table_repository.dart';

class TablePageContent extends StatelessWidget {
  const TablePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TableCubit(TableRepository())..start(),
      child: const TablePageView(),
    );
  }
}
