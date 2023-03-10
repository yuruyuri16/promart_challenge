import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promart_challenge/edit_user/edit_user.dart';
import 'package:promart_challenge/home/home.dart';
import 'package:promart_challenge/l10n/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isOnline =
        context.select((ConnectivityBloc bloc) => bloc.state.isOnline);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.homeAppBarTitle)),
      body: isOnline
          ? BlocBuilder<HomeBloc, HomeState>(
              builder: (_, state) {
                if (state.status.isInitial || state.status.isLoading) {
                  return const HomeLoading();
                } else if (state.status.isSuccess) {
                  return const HomeSuccess();
                } else if (state.status.isFailure) {
                  return const HomeFailure();
                }
                return const SizedBox.shrink();
              },
            )
          : Center(child: Text(l10n.homeNoConnectionText)),
      floatingActionButton: isOnline
          ? FloatingActionButton(
              onPressed: () => Navigator.push<void>(
                context,
                EditUserPage.route(),
              ),
              tooltip: l10n.homeAddUserTooltip,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
