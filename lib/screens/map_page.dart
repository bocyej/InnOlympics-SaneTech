import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(12.8797, 121.7740), // Philippines coordinates
          zoom: 5,
        ),
        onTap: (LatLng latLng) {
          setState(() {
            selectedLocation = latLng;
          });
        },
        markers: selectedLocation != null
            ? {
                Marker(
                  markerId: MarkerId('selectedLocation'),
                  position: selectedLocation!,
                ),
              }
            : {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, selectedLocation);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}