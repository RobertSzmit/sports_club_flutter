import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_club_flutter/app/features/news/cubit/news_cubit.dart';
import 'package:sports_club_flutter/app/models/news_item_model.dart';
import 'package:sports_club_flutter/app/repositories/news_repository.dart';

class NewsDetailsPage extends StatelessWidget {
  final String newsId;

  const NewsDetailsPage({super.key, required this.newsId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(NewsRepository())..loadNewsDetails(newsId),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          
          final newsItem = state.newsItems.firstWhere(
            (item) => item.id == newsId,
            orElse: () => NewsItem(
              id: '',
              title: '',
              content: '',
              imageUrl: null,
              details: null,
            ),
          );
          
          if (newsItem.id.isEmpty) {
            return Scaffold(
              appBar: AppBar(title: const Text('News Details')),
              body: const Center(child: Text('News not found')),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(newsItem.title),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (newsItem.imageUrl != null)
                    Image.network(newsItem.imageUrl!),
                  const SizedBox(height: 16),
                  Text(
                    newsItem.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(newsItem.content),
                  if (newsItem.details != null) ...[
                    const SizedBox(height: 16),
                    Text(newsItem.details!),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}