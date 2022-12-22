// ignore_for_file: prefer_const_constructors

import 'package:connectivity_repository/connectivity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocation_repository/geolocation_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:promart_challenge/app/app.dart';
import 'package:promart_challenge/home/home.dart';
import 'package:user_repository/user_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockGeolocationRepository extends Mock implements GeolocationRepository {}

class MockConnectivityRepository extends Mock
    implements ConnectivityRepository {}

void main() {
  late UserRepository userRepository;
  late GeolocationRepository geolocationRepository;
  late ConnectivityRepository connectivityRepository;

  group('App', () {
    setUp(() {
      userRepository = MockUserRepository();
      geolocationRepository = MockGeolocationRepository();
      connectivityRepository = MockConnectivityRepository();
      when(() => userRepository.getUsers()).thenAnswer((_) async {});
      when(() => userRepository.users()).thenAnswer((_) => Stream.empty());
    });

    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(
        App(
          userRepository: userRepository,
          geolocationRepository: geolocationRepository,
          connectivityRepository: connectivityRepository,
        ),
      );
      expect(find.byType(AppView), findsOneWidget);
    });
  });

  group('AppView', () {
    setUp(() {
      userRepository = MockUserRepository();
      geolocationRepository = MockGeolocationRepository();
      when(() => userRepository.getUsers()).thenAnswer((_) async {});
      when(() => userRepository.users()).thenAnswer((_) => Stream.empty());
    });

    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(value: userRepository),
            RepositoryProvider.value(value: geolocationRepository),
          ],
          child: AppView(),
        ),
      );
      expect(find.byType(MaterialApp), findsOneWidget);
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, equals(AppTheme.lightTheme));
      expect(materialApp.darkTheme, equals(AppTheme.darkTheme));
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
