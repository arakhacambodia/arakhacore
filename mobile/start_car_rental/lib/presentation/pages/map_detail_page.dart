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
        options: MapOptions(
          center: LatLng(51, 0.09),
          zoom: 10,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{{s}}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
        ],
        children: [],
      ),
    );
  }
}
