import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition _initialCameraPosition;
  late GoogleMapController _googleMapController;
  @override
  void initState() {
    super.initState();
    _initialCameraPosition = const CameraPosition(
      target: LatLng(
        31.199586955593464,
        29.95249037375806,
      ),
      zoom: 12,
    );
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) {
            _googleMapController = controller;
          },
          initialCameraPosition: _initialCameraPosition,
          // cameraTargetBounds: CameraTargetBounds(
          //   LatLngBounds(
          //     northeast: const LatLng(
          //       31.277323775337162,
          //       30.018582493682597,
          //     ),
          //     southwest: const LatLng(
          //       31.168060695674846,
          //       29.878664590311327,
          //     ),
          //   ),
          // ),
        ),
        Positioned(
          left: 16,
          bottom: 20,
          right: 16,
          child: ElevatedButton(
            onPressed: () {
              const newLatLng = LatLng(
                30.668191893253233,
                30.07982852469962,
              );
              _googleMapController.animateCamera(
                CameraUpdate.newLatLng(newLatLng),
              );
            },
            child: const Text(
              'change camera position',
            ),
          ),
        )
      ],
    );
  }
}
