import 'package:flutter/material.dart';
import 'package:sports_club_flutter/app/news/news_banner_page_content.dart';

class NewsPageContent extends StatelessWidget {
  const NewsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LKS Żuławy Nowy Dwór Gd.'),
      ),
      body: const NewsBannerPageContent(),
    );
  }
}
