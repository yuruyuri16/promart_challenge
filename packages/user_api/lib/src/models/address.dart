import 'package:isar/isar.dart';
import 'package:user_api/src/models/models.dart';

part 'address.g.dart';

/// {@template address}
/// Address model
/// {@endtemplate}
@embedded
class Address {
  /// {@macro address}
  const Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  /// {@macro address}
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'] as String?,
        suite: json['suite'] as String?,
        city: json['city'] as String?,
        zipcode: json['zipcode'] as String?,
        geo: Geo.fromJson(json['geo'] as Map<String, dynamic>),
      );

  /// Street name
  final String? street;

  /// Suite name
  final String? suite;

  /// City name
  final String? city;

  /// Zipcode
  final String? zipcode;

  /// Geolocation
  final Geo? geo;
}
