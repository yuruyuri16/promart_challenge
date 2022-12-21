part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState({
    this.latLng = const LatLng(0, 0),
  });

  final LatLng latLng;

  @override
  List<Object> get props => [latLng];
}
