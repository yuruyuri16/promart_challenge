import 'package:connectivity_repository/connectivity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocation_repository/geolocation_repository.dart';
import 'package:promart_challenge/app/app.dart';
import 'package:promart_challenge/home/home.dart';
import 'package:promart_challenge/l10n/l10n.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required UserRepository userRepository,
    required GeolocationRepository geolocationRepository,
    required ConnectivityRepository connectivityRepository,
  })  : _userRepository = userRepository,
        _geolocationRepository = geolocationRepository,
        _connectivityRepository = connectivityRepository;

  final UserRepository _userRepository;
  final GeolocationRepository _geolocationRepository;
  final ConnectivityRepository _connectivityRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _userRepository),
        RepositoryProvider.value(value: _geolocationRepository),
        RepositoryProvider.value(value: _connectivityRepository),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
