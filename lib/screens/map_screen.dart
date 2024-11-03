import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String locationName;

  const MapScreen({
    required this.latitude,
    required this.longitude,
    required this.locationName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locationName),
        backgroundColor: Colors.teal,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(latitude, longitude),
          zoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(latitude, longitude),
                width: 80.0,
                height: 80.0,
                builder: (ctx) => Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
