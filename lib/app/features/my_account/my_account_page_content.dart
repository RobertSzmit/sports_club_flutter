import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_club_flutter/app/features/my_account/cubit/my_account_cubit.dart';
import 'package:sports_club_flutter/app/features/my_account/cubit/my_account_state.dart';
import 'package:sports_club_flutter/app/repositories/my_account_repository.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyAccountCubit(MyAccountRepository())..loadUserData(),
      child: BlocBuilder<MyAccountCubit, MyAccountState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.userItem != null) {
            final user = state.userItem!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Witaj, ${user.username}!'),
                  const SizedBox(height: 10),
                  if (user.email != null)
                    Text('Jesteś zalogowany jako ${user.email}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MyAccountCubit>().signOut();
                    },
                    child: const Text('Wyloguj'),
                  ),
                ],
              ),
            );
          } else if (state.errorMessage.isNotEmpty) {
            return Center(child: Text(state.errorMessage));
          }
          return const Center(child: Text('Nieznany stan'));
        },
      ),
    );
  }
}
