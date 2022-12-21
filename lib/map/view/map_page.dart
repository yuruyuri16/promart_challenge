import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocation_repository/geolocation_repository.dart';
import 'package:promart_challenge/map/map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key, required this.latLng});

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapBloc(latLng),
      child: const MapView(),
    );
  }
}
