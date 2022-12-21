import 'package:equatable/equatable.dart';

///
class LatLng extends Equatable {
  ///
  const LatLng(this.latitude, this.longitude);

  ///
  final double latitude;

  ///
  final double longitude;

  @override
  List<Object> get props => [latitude, longitude];
}
