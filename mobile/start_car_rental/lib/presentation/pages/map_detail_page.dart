import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDetailPage extends StatelessWidget {
  const MapDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(51, 0.09),
          initialZoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(11, 15),
                child: FlutterLogo(),
                width: 80,
                height: 80,
              )
            ],
          ),
        ],
      ),
    );
  }
}
