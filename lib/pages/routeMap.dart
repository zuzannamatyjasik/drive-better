import 'package:drivebetter/services/coordinatesList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteMap extends StatelessWidget {
  Map data = {};
  GoogleMapController mapController;
  LatLng _centerPoczatek = const LatLng(54.44061421, 18.57582930);
  LatLng _centerKoniec = const LatLng(54.44061421, 18.57582930);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<Marker> allMarkers = [];
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    _centerPoczatek =
        LatLng(data['latitude_poczatek'], data['longitude_poczatek']);
    _centerKoniec = LatLng(data['latitude_koniec'], data['longitude_koniec']);

    return FutureBuilder(
      future: loadJson(data['latitude_poczatek'], data['longitude_poczatek'],
          data['latitude_koniec'], data['longitude_koniec']),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          polylineCoordinates = snapshot.data;

          polylines.add(Polyline(
            polylineId: PolylineId('trasa'),
            visible: true,
            points: polylineCoordinates,
            color: Colors.blue,
          ));

          allMarkers.add(Marker(
            markerId: MarkerId('poczatek'),
            draggable: false,
            position: _centerPoczatek,
          ));
          allMarkers.add(Marker(
            markerId: MarkerId('koniec'),
            draggable: false,
            position: _centerKoniec,
          ));

          return MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    'drive better',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                        color: Theme.of(context).accentColor)
                  ],
                ),
                body: Container(
                  color: Theme.of(context).hintColor,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 430,
                        child: GoogleMap(
                          markers: Set.from(allMarkers),
                          polylines: polylines,
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _centerPoczatek,
                            zoom: 15.0,
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
                                'Cena za kurs: ${(data['cenaPoczatkowa'] +
                                    (data['cenaZaKm'] * (dystans/1000))).toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FloatingActionButton(
                                backgroundColor: Theme.of(context).highlightColor,
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
              ));
        } else {
          return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Center(
                child: SpinKitCircle(
                  color: Theme.of(context).accentColor,
                  size: 150.0,
                  duration: Duration(seconds: 1),
                ),
              ));
        }
      },
    );
  }
}