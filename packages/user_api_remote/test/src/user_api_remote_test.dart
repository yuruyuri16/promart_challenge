// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_api_remote/user_api_remote.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('UserApiRemote', () {
    late Dio httpClient;

    setUp(() {
      httpClient = MockDio();
    });

    test('can be instantiated', () {
      expect(UserApiRemote(httpClient: httpClient), isNotNull);
    });
  });
}
