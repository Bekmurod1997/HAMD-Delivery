import 'package:HAMD/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController _googleMapController;

  Position _currentPosition;
  String _currentAddress;
  LatLng _finalPosition;
  Marker _origin;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
    getCurrentPosition();
  }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(41.26465, 69.21627),
    zoom: 11.5,
  );

  getCurrentPosition() async {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        if (_googleMapController != null)
          _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(
                    _currentPosition.latitude, _currentPosition.longitude),
                zoom: 15.0,
              ),
            ),
          );
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.street}";
        _finalPosition =
            LatLng(_currentPosition.latitude, _currentPosition.longitude);
      });
      print(_currentAddress);
    } catch (e) {
      print(e);
    }
  }

  _getAddressFromLatLngOnMove(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.thoroughfare}, ${place.subThoroughfare}";
        _finalPosition = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: _initialCameraPosition,
            markers: {
              if (_origin != null) _origin,
            },
            onTap: (LatLng pos) => _addMarker(pos),
          ),
          SafeArea(
              child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  'Адрес',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  '$_currentAddress' ?? '',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 20),
              child: SizedBox(
                width: 240.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  color: ColorPalatte.strongRedColor,
                  child: Text(
                    'Готово',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 1.1,
                    ),
                  ),
                  onPressed: () {
                    print(_finalPosition);
                    print(_finalPosition.latitude);
                    print(_finalPosition.longitude);
                    Get.back(
                      result: {
                        'address': _currentAddress,
                        'position': _finalPosition,
                        // 'lat': _finalPosition.latitude.toString(),
                        // 'lng': _finalPosition.longitude.toString(),
                      },
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: ColorPalatte.strongRedColor,
            child: Icon(
              Icons.near_me,
              size: 30.0,
            ),
            onPressed: () => getCurrentPosition()),
      ),
    );
  }

  void _addMarker(LatLng pos) {
    setState(() {
      _origin = null;
    });
    if (_origin == null) {
      setState(() {
        _origin = Marker(
          markerId: MarkerId('origin'),
          infoWindow: InfoWindow(title: 'Origin'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos,
        );
      });
      _getAddressFromLatLngOnMove(pos);
    }
  }
}
