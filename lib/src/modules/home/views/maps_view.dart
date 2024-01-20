import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as Location;
import 'package:punyam/src/app/app.dart';
import 'package:punyam/src/core/core.dart';

class MapsScreen extends StatefulWidget {
  final GetSaveAddressDetails? product;
  MapsScreen({this.product, super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen>
    with SingleTickerProviderStateMixin {
  GoogleMapController? mapController;
  LatLng currentCenter = LatLng(28.4744, 77.5040);
  bool _isLoading = false; // Initial center position
  late AnimationController _animationController;
  late Animation<double> _animation;
  Location.Location location = new Location.Location();
  HomeController homeController = Get.find<HomeController>();

  Future<void> _initializeMapLocation() async {
    LatLng initialLocation = LatLng(28.4744, 77.5040);
    if (widget.product?.location != null) {
      initialLocation = LatLng(widget.product!.location!.coordinates!.first,
          widget.product!.location!.coordinates!.last);
      setState(() {
        currentCenter = initialLocation;
        _isLoading = false;
      });
      return;
    }
    setState(() {
      _isLoading = true;
    }); // Default location
    if (AppStorage.locationLatitude() != null &&
        AppStorage.locationLongitude() != null) {
      initialLocation = LatLng(double.parse(AppStorage.locationLatitude()!),
          double.parse(AppStorage.locationLongitude()!));
    }
    bool serviceEnabled = await location.serviceEnabled();
    if (serviceEnabled) {
      Location.PermissionStatus permissionGranted =
          await location.hasPermission();
      if (permissionGranted == Location.PermissionStatus.granted) {
        try {
          var currentLocation = await location.getLocation();
          initialLocation =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        } catch (e) {
          // If unable to fetch the location, fall back to AppStorage or default
          if (AppStorage.locationLatitude() != null &&
              AppStorage.locationLongitude() != null) {
            initialLocation = LatLng(
                double.parse(AppStorage.locationLatitude()!),
                double.parse(AppStorage.locationLongitude()!));
          }
        }
      } else {
        if (AppStorage.locationLatitude() != null &&
            AppStorage.locationLongitude() != null) {
          initialLocation = LatLng(double.parse(AppStorage.locationLatitude()!),
              double.parse(AppStorage.locationLongitude()!));
        }
      }
    } else {
      if (AppStorage.locationLatitude() != null &&
          AppStorage.locationLongitude() != null) {
        initialLocation = LatLng(double.parse(AppStorage.locationLatitude()!),
            double.parse(AppStorage.locationLongitude()!));
      }
    }

    setState(() {
      currentCenter = initialLocation;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeMapLocation();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 100.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onCameraMove(CameraPosition position) {
    // Update center position as the camera moves
    currentCenter = position.target;
  }

  void _onCameraIdle() {
    _animationController.reset();
    _animationController.forward();
    // print("Selected Position: $currentCenter");
    // Print out the final position when user stops moving the map
    homeController.mapLatitude.value = currentCenter.latitude.toString();
    homeController.mapLongitude.value = currentCenter.longitude.toString();

    print("Selected Position: $currentCenter");
  }

  // Future<void> _goToCurrentLocation() async {
  //   var currentLocation = await location.getLocation();
  //   mapController?.animateCamera(CameraUpdate.newCameraPosition(
  //     CameraPosition(
  //       target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
  //       zoom: 18.0,
  //     ),
  //   ));
  // }
  Future<void> _goToCurrentLocation() async {
    // Check if the location service is enabled
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      // Request to enable the location service
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Location service is still not enabled
        return;
      }
    }

    // Check for location permission
    Location.PermissionStatus permissionGranted =
        await location.hasPermission();
    if (permissionGranted == Location.PermissionStatus.denied) {
      // Request permission
      permissionGranted = await location.requestPermission();
      if (permissionGranted != Location.PermissionStatus.granted) {
        // Permissions are not granted
        return;
      }
    }

    // Permissions are granted, fetch the current location
    var currentLocation = await location.getLocation();
    mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 18.0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Confirm Location'),
      ),
      body: _isLoading == false
          ? Column(
              children: <Widget>[
                Expanded(
                  flex: 7, // This makes the map take 80% of the screen height
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        zoomControlsEnabled: false,
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: currentCenter,
                          zoom: 18.0,
                        ),
                        onCameraMove: _onCameraMove,
                        onCameraIdle: _onCameraIdle,
                        myLocationButtonEnabled: false,
                      ),
                      Container(
                        width: _animation.value,
                        height: _animation.value,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.cinnamonStickColor
                              .withOpacity(1 - _animationController.value),
                        ),
                      ),
                      // Center Marker Icon
                      Icon(
                        Icons.location_on_rounded,
                        size: 50,
                        color: AppColors.cinnamonStickColor,
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: _goToCurrentLocation,
                            child: Text('Use My Current Location'),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.cinnamonStickColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex:
                      1, // This makes the button take 20% of the screen height
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.cinnamonStickColor),
                      onPressed: () => {
                        BottomSheetHelper.openBottomSheet(
                            context: context,
                            child: AddressBottomSheet(product: widget.product))
                      },
                      child: Text('Enter the complete address'),
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
