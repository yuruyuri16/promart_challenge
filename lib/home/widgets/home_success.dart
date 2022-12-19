import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promart_challenge/home/home.dart';
import 'package:promart_challenge/l10n/l10n.dart';

class HomeSuccess extends StatelessWidget {
  const HomeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final users = context.select((HomeBloc bloc) => bloc.state.users);

    if (users.isEmpty) return Center(child: Text(l10n.homeEmptyUserListText));

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) {
        return UserTile(
          user: users[index],
          onDelete: (_) =>
              context.read<HomeBloc>().add(HomeUserDeletePressed(users[index])),
        );
      },
    );
  }
}
