import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:istaff/utils/constants.dart';
import 'package:istaff/widgets/mybtmnav.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart' as mapboxgl;


final DateFormat formatter = DateFormat("dd MMM yyyy, hh:mm:ss");

class LocationProvider extends ChangeNotifier {
  Position? _currentPosition;

  Position? get currentPosition => _currentPosition;

  void updateLocation(Position position) {
    _currentPosition = position;
    notifyListeners();
  }
}

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationProvider()),
      ],
      child: DetailsAttendanceScreen()
    );
  }
}

class DetailsAttendanceScreen extends StatefulWidget {
  @override
  _DetailsAttendanceScreenState createState() =>
      _DetailsAttendanceScreenState();
}

// class _DetailsAttendanceScreenState extends State<DetailsAttendanceScreen> with AutomaticKeepAliveClientMixin{
class _DetailsAttendanceScreenState extends State<DetailsAttendanceScreen>{
  
  @override
  void dispose() {
    // TODO: implement dispose
    // _userLocation = null;
    _isMapReady = false;
    _isClockIn = false;
    super.dispose();
  }
  
  // @override
  // bool get wantKeepAlive => true;
  bool _isClockIn = false;
  // mapboxgl.MapboxMapController? _mapController;
  bool _isMapReady = false;
  // Position? _userLocation;

  void _onMapCreated(mapController) async {
    // Get the user's current location
    Position position = await _getCurrentLocation();
    // if(!position.isMocked){
    //   setState(() {
    //     _userLocation = position;
    //   });
    // }

    // Move the camera to the user's current location
    mapController.animateCamera(
      mapboxgl.CameraUpdate.newLatLngZoom(
        mapboxgl.LatLng(position.latitude, position.longitude),
        15.0, // You can adjust the zoom level as needed
      ),
    );

    // Add a pin icon at the user's current location
    if (_isMapReady) {
      mapController?.addSymbol(
        mapboxgl.SymbolOptions(
          geometry: mapboxgl.LatLng(position.latitude, position.longitude),
          iconImage: 'assets/images/location.png', // Replace with your pin icon image asset
          iconSize: 0.2,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kToolbarHeight,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: const Icon(
                    //     Icons.arrow_back_ios,
                    //     color: Colors.black,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20.0,
                    // ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Live Attendance",
                            style:
                                Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Colors.black,
                                    ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 400,
                      child: mapboxgl.MapboxMap(
                        // accessToken: const String.fromEnvironment("MAPBOX_DOWNLOADS_TOKEN"),
                        accessToken: 'sk.eyJ1IjoiY2FoeW9pbmRvY2hhdCIsImEiOiJjbG96cnRnd28wM3hhMmlwYjN1ejBrOWM5In0.Fd3cgzr_suhCqgqYTVDl6w',
                        styleString: 'mapbox://styles/mapbox/streets-v11',
                        onMapCreated: (mapController) {
                          setState(() {
                            // _mapController = mapController;
                            _isMapReady = true;
                          });
                          // You can add map controller logic here if needed
                          _onMapCreated(mapController);
                        },
                        initialCameraPosition: const mapboxgl.CameraPosition(
                          target: mapboxgl.LatLng(0, 0),
                          zoom: 1,
                        ),
                      ),
                    ),
                    Divider(),
                    const SizedBox(height: 20),
                    const Text(
                      'Your Location:',
                      textAlign:TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Consumer<LocationProvider>(
                      builder: (context, locationProvider, _) {
                        return Text(
                          locationProvider.currentPosition != null
                              ? 'Latitude: ${locationProvider.currentPosition!.latitude}, Longitude: ${locationProvider.currentPosition!.longitude}'
                              : 'Location not available',
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Attendance Date & Time:',
                      textAlign:TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Visibility(
                      visible: _isClockIn,
                      child:Text(
                        formatter.format(DateTime.now()).toString(),
                        textAlign:TextAlign.right,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        Position position = await _getCurrentLocation();
                        if(!position.isMocked){
                          setState(() {
                            _isClockIn = true;
                          });
                        }
                        context.read<LocationProvider>().updateLocation(position);
                      },
                      child: const Text('Clock In'),
                    ),
                  ],
                ),
              ),
            ),
          ]
        )
      ),
    );
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied, cannot request permissions.';
    }
    
    var res = await Geolocator.getCurrentPosition();

    return res;
  }
}
