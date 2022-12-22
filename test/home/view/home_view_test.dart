// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:promart_challenge/home/home.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockNavigator navigator;
  late HomeBloc homeBloc;
  late UserRepository userRepository;
  group('HomeView', () {
    final users = [
      User(
        name: 'test_name',
        username: 'test_username',
        email: 'test_email',
        address: Address(
          street: 'test_street',
          suite: 'test_suite',
          city: 'test_city',
          zipcode: 'test_zipcode',
          geo: Geo(lat: 0, lng: 0),
        ),
        phone: 'test_phone',
      )
    ];
    setUp(() {
      navigator = MockNavigator();
      when(() => navigator.push<void>(any())).thenAnswer((_) async {});
      homeBloc = MockHomeBloc();
      when(() => homeBloc.state).thenReturn(HomeState());
      userRepository = MockUserRepository();
      when(() => userRepository.getUsers()).thenAnswer((_) async {});
    });

    testWidgets('renders HomeLoading for HomeStatus.initial', (tester) async {
      await tester.pumpApp(
        userRepository: userRepository,
        widget: MockNavigatorProvider(
          navigator: navigator,
          child: BlocProvider.value(
            value: homeBloc,
            child: HomeView(),
          ),
        ),
      );
      expect(find.byType(HomeLoading), findsOneWidget);
    });

    testWidgets('renders HomeLoading for HomeStatus.loading', (tester) async {
      when(() => homeBloc.state)
          .thenReturn(HomeState(status: HomeStatus.loading));
      await tester.pumpApp(
        userRepository: userRepository,
        widget: MockNavigatorProvider(
          navigator: navigator,
          child: BlocProvider.value(
            value: homeBloc,
            child: HomeView(),
          ),
        ),
      );
      expect(find.byType(HomeLoading), findsOneWidget);
    });

    testWidgets('renders HomeSuccess for HomeStatus.success', (tester) async {
      when(() => homeBloc.state)
          .thenReturn(HomeState(status: HomeStatus.success, users: users));
      await tester.pumpApp(
        userRepository: userRepository,
        widget: MockNavigatorProvider(
          navigator: navigator,
          child: BlocProvider.value(
            value: homeBloc,
            child: HomeView(),
          ),
        ),
      );
      expect(find.byType(HomeSuccess), findsOneWidget);
    });

    testWidgets('renders HomeFailure for HomeStatus.failure', (tester) async {
      when(() => homeBloc.state)
          .thenReturn(HomeState(status: HomeStatus.failure));
      await tester.pumpApp(
        userRepository: userRepository,
        widget: MockNavigatorProvider(
          navigator: navigator,
          child: BlocProvider.value(
            value: homeBloc,
            child: HomeView(),
          ),
        ),
      );
      expect(find.byType(HomeFailure), findsOneWidget);
    });

    testWidgets('navigates to EditUserPage when pressed', (tester) async {
      await tester.pumpApp(
        userRepository: userRepository,
        widget: MockNavigatorProvider(
          navigator: navigator,
          child: BlocProvider.value(
            value: homeBloc,
            child: HomeView(),
          ),
        ),
      );
      await tester.tap(find.byType(FloatingActionButton));
      verify(() => navigator.push<void>(any(that: isRoute<void>()))).called(1);
      // await tester.pumpAndSettle();
      // expect(find.byType(EditUserPage), findsOneWidget);
    });
  });
}
