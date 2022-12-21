import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promart_challenge/edit_user/edit_user.dart';
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
        final user = users[index];
        return UserTile(
          user: user,
          onTap: () {},
          onEdit: (_) => Navigator.push<void>(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (_) => EditUserPage(user: user),
            ),
          ),
          onDelete: (_) =>
              context.read<HomeBloc>().add(HomeUserDeletePressed(user)),
        );
      },
    );
  }
}
