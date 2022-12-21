import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocation_repository/geolocation_repository.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc(LatLng latLng) : super(MapState(latLng: latLng)) {
    on<MapEvent>((event, emit) {});
  }
}
