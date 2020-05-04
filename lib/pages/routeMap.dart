import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteMap extends StatefulWidget {
  @override
  _RouteMapState createState() => _RouteMapState();
}

class _RouteMapState extends State<RouteMap> {
  Map data = {};
  GoogleMapController mapController;
  LatLng _centerPoczatek = const LatLng(45.521563, -122.677433);
  LatLng _centerKoniec = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<Marker> allMarkers = [];

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    _centerPoczatek =
        LatLng(data['latitude_poczatek'], data['longitude_poczatek']);
    _centerKoniec = LatLng(data['latitude_koniec'], data['longitude_koniec']);

    allMarkers.add(Marker(
      markerId: MarkerId('poczatek'),
      draggable: false,
      onTap: () {
        print('Tapped');
      },
      position: _centerPoczatek,
    ));
    allMarkers.add(Marker(
      markerId: MarkerId('koniec'),
      draggable: false,
      onTap: () {
        print('Tapped');
      },
      position: _centerKoniec,
    ));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'drive better',
            style: TextStyle(
              letterSpacing: 2,
              color: Colors.black
            ),
          ),
          backgroundColor: Colors.orangeAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 430,
              child: GoogleMap(
                markers: Set.from(allMarkers),
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _centerPoczatek,
                  zoom: 11.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Cena za kurs: ',
                        style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                    flex: 1,
                    child: FloatingActionButton(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.local_phone),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
