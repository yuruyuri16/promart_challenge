part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState({
    this.latLng = const LatLng(0, 0),
    this.phone = '',
  });

  final LatLng latLng;
  final String phone;

  @override
  List<Object> get props => [latLng, phone];
}
