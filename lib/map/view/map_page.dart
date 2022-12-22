import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocation_repository/geolocation_repository.dart';
import 'package:promart_challenge/map/map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key, required this.latLng, required this.phone});

  final LatLng latLng;
  final String phone;

  static Route<void> route({required LatLng latlng, required String phone}) =>
      MaterialPageRoute(builder: (_) => MapPage(latLng: latlng, phone: phone));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapBloc(latLng, phone),
      child: const MapView(),
    );
  }
}
