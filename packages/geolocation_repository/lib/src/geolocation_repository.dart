import 'package:geolocation_repository/src/exceptions.dart';
import 'package:geolocation_repository/src/models/models.dart';
import 'package:geolocator/geolocator.dart';

/// {@template geolocation_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class GeolocationRepository {
  /// {@macro geolocation_repository}
  const GeolocationRepository();

  ///
  Future<LatLng> getCurrentLocation() async {
    await _checkPermissions();
    try {
      final position = await Geolocator.getCurrentPosition();
      return position.toLatLng;
    } catch (_) {
      throw GeolocatorGetCurrentLocationFailure();
    }
  }

  ///
  Future<void> _checkPermissions() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw GeolocatorLocationServiceDisabledFailure();
      }
      var permission = await Geolocator.checkPermission();
      if (permission.isDenied) {
        permission = await Geolocator.requestPermission();
        if (permission.isDenied) {
          throw GeolocatorPermissionDeniedFailure();
        }
      } else if (permission.isDeniedForever) {
        throw GeolocatorDeniedForeverFailure();
      }
    } catch (_) {
      throw GeolocatorPermissionCheckFailedFailure();
    }
  }
}

extension on LocationPermission {
  bool get isDenied => this == LocationPermission.denied;
  bool get isDeniedForever => this == LocationPermission.deniedForever;
}

extension on Position {
  LatLng get toLatLng => LatLng(latitude, longitude);
}
