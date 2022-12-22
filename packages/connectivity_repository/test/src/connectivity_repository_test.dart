// ignore_for_file: prefer_const_constructors

import 'package:connectivity_repository/connectivity_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ConnectivityRepository', () {
    test('can be instantiated', () {
      expect(ConnectivityRepository(), isNotNull);
    });
  });
}
