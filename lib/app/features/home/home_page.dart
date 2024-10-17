import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_club_flutter/app/features/chat/chat_page_content.dart';
import 'package:sports_club_flutter/app/features/home/cubit/home_cubit.dart';
import 'package:sports_club_flutter/app/features/my_account/my_account_page_content.dart';
import 'package:sports_club_flutter/app/features/news/news_page_content.dart';
import 'package:sports_club_flutter/app/features/schedule/schedule_page_content.dart';
import 'package:sports_club_flutter/app/features/table/table_page_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(user),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state.errorMessage.isNotEmpty) {
          return Scaffold(
            body: Center(child: Text('Error: ${state.errorMessage}')),
          );
        }
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNavigationBar(context, state),
        );
      },
    );
  }

  Widget _buildBody(HomeState state) {
    switch (state.homeItem.currentIndex) {
      case 0:
        return const NewsPageContent();
      case 1:
        return const TablePageContent();
      case 2:
        return const SchedulePageContent();
      case 3:
        return const ChatPageContent();
      case 4:
        return MyAccountPageContent(email: state.homeItem.user.email);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildBottomNavigationBar(BuildContext context, HomeState state) {
    return BottomNavigationBar(
      currentIndex: state.homeItem.currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (newIndex) {
        context.read<HomeCubit>().changeIndex(newIndex);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Aktualności',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.format_list_numbered),
          label: 'Tabela',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Terminarz',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Czat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Moje konto',
        ),
      ],
    );
  }
}