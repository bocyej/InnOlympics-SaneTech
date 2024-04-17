import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController mapController;
  LatLng? currentPosition;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _checkPermissionAndGetLocation();
  }

  Future<void> _checkPermissionAndGetLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permission;

    // Check if location service is enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check if location permission is granted
    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }

    // Get current location
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Location location = Location();
      LocationData currentLocation = await location.getLocation();
      setState(() {
        currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        markers.add(
          Marker(
            markerId: MarkerId('currentLocation'),
            position: currentPosition!,
          ),
        );
      });
    } catch (e) {
      print("Error getting current location: $e");
    }
  }

  void _goToCurrentLocation() {
    mapController.animateCamera(CameraUpdate.newLatLng(currentPosition!));
  }

  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Google Maps"),
        ),
        body: currentPosition != null
            ? Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: currentPosition!,
                      zoom: 13,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      setState(() {
                        mapController = controller;
                      });
                    },
                    markers: markers,
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    child: FloatingActionButton(
                      onPressed: _goToCurrentLocation,
                      child: Icon(Icons.my_location),
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
