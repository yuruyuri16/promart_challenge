import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promart_challenge/home/home.dart';

class HomeSuccess extends StatelessWidget {
  const HomeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final users = context.read<HomeBloc>().state.users;

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) {
        return UserTile(user: users[index]);
      },
    );
  }
}
