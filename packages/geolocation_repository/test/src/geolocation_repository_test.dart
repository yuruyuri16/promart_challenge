// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:geolocation_repository/geolocation_repository.dart';

void main() {
  group('GeolocationRepository', () {
    test('can be instantiated', () {
      expect(GeolocationRepository(), isNotNull);
    });
  });
}
