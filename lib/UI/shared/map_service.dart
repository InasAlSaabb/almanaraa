import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:almanaraa/UI/shared/colors.dart';

class MapScreen extends StatefulWidget {
  final Function(LatLng)? onLocationSelected;

  const MapScreen({Key? key, this.onLocationSelected}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapController = MapController();
  LatLng currentLocation = LatLng(33.5138, 36.2765);
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => isLoading = false);
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
        isLoading = false;
      });

      if (widget.onLocationSelected != null) {
        widget.onLocationSelected!(currentLocation);
      }
    } catch (e) {
      print('خطأ في الحصول على الموقع: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: AppColors.secondaryTextColor.withOpacity(0.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: currentLocation,
                initialZoom: 15.0,
                onTap: (_, point) {
                  setState(() => currentLocation = point);
                  if (widget.onLocationSelected != null) {
                    widget.onLocationSelected!(point);
                  }
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.almanaraa.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: currentLocation,
                      width: 60,
                      height: 60,
                      child: Icon(
                        Icons.location_on,
                        color: AppColors.mainTextColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainTextColor,
                ),
              ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon:
                      Icon(Icons.my_location, color: AppColors.mainOrangeColor),
                  onPressed: () async {
                    await _getCurrentLocation();
                    mapController.move(currentLocation, 15.0);
                  },
                  iconSize: 20,
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
