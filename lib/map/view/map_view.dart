import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:promart_challenge/l10n/l10n.dart';
import 'package:promart_challenge/map/map.dart';
import 'package:url_launcher/url_launcher.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late final GoogleMapController _controller;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    final latlng = context.read<MapBloc>().state.latLng;
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latlng.latitude, latlng.longitude),
          zoom: 17,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final padding = MediaQuery.of(context).padding;
    final phone = context.read<MapBloc>().state.phone;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.mapAppBarTitle),
        actions: [
          IconButton(
            onPressed: () {
              launchUrl(Uri(scheme: 'tel', path: phone));
            },
            icon: const Icon(Icons.phone),
            tooltip: l10n.mapCallTooltip,
          ),
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        padding: EdgeInsets.fromLTRB(0, 0, 0, padding.top),
        initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
      ),
    );
  }
}
