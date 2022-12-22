import 'package:connectivity_repository/connectivity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promart_challenge/home/home.dart';
import 'package:user_repository/user_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(context.read<UserRepository>())
            ..add(HomeUsersRequested()),
        ),
        BlocProvider(
          create: (context) =>
              ConnectivityBloc(context.read<ConnectivityRepository>()),
          lazy: false,
        ),
      ],
      child: const HomeView(),
    );
  }
}
