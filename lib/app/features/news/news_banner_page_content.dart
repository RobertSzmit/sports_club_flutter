import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_club_flutter/app/features/news/cubit/news_banner_cubit.dart';
import 'package:sports_club_flutter/app/features/news/news_banner_page_view.dart';
import 'package:sports_club_flutter/app/repositories/news_repository.dart';

class NewsBannerPageContent extends StatelessWidget {
  const NewsBannerPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBannerCubit(NewsRepository())..start(),
      child: const NewsBannerPageView(),
    );
  }
}
