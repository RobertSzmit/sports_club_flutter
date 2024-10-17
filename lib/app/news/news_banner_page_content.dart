import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_club_flutter/app/news/cubit/news_banner_cubit.dart';
import 'package:sports_club_flutter/app/news/news_banner_page_view.dart';

class NewsBannerPageContent extends StatelessWidget {
  const NewsBannerPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBannerCubit()..start(),
      child: const NewsBannerPageView(),
    );
  }
}
