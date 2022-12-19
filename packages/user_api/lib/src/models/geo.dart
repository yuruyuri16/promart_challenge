import 'package:isar/isar.dart';

part 'geo.g.dart';

/// {@template geo}
/// Geo model
/// {@endtemplate}
@embedded
class Geo {
  /// {@macro geo}
  const Geo({
    this.lat,
    this.lng,
  });

  /// {@macro geo}
  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: double.parse(json['lat'] as String),
        lng: double.parse(json['lng'] as String),
      );

  /// User latitude
  final double? lat;

  /// User longitude
  final double? lng;
}
