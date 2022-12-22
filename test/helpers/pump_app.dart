import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocation_repository/geolocation_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:promart_challenge/l10n/l10n.dart';
import 'package:user_repository/user_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockGeolocationRepository extends Mock implements GeolocationRepository {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp({
    required Widget widget,
    UserRepository? userRepository,
    GeolocationRepository? geolocationRepository,
  }) {
    return pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: userRepository ?? MockUserRepository(),
          ),
          RepositoryProvider.value(
            value: geolocationRepository ?? MockGeolocationRepository(),
          )
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: widget,
        ),
      ),
    );
  }
}
