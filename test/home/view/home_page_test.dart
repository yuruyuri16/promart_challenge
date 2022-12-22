// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:promart_challenge/home/home.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

void main() {
  late UserRepository userRepository;

  group('HomePage', () {
    setUp(() {
      userRepository = MockUserRepository();
      when(() => userRepository.getUsers()).thenAnswer((_) async {});
      when(() => userRepository.users()).thenAnswer((_) => Stream.empty());
    });

    testWidgets('renders HomeView', (tester) async {
      await tester.pumpApp(
        userRepository: userRepository,
        widget: HomePage(),
      );
      expect(find.byType(HomeView), findsOneWidget);
    });
  });
}
