import 'package:drivebetter/services/coordinatesList.dart';
import 'package:drivebetter/services/idInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteMap extends StatelessWidget {
  Map data = {};

  List<String> message = [
    "Pomocy",
    "Zadzwoń szybko",
    "Kierowca jest agresywny"
  ];

  GoogleMapController mapController;
  LatLng _centerPoczatek = const LatLng(54.44061421, 18.57582930);
  LatLng _centerKoniec = const LatLng(54.44061421, 18.57582930);

  List<Marker> allMarkers = [];
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Wysylanie SMS do numeru alarmowego
  void _wyslijSMS(String message) async {
    String numerTelefonu = await getAndroidId();
    List<String> recipents = [numerTelefonu];

    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
  }

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
                            'Cena za kurs: ${(data['cenaPoczatkowa'] + (data['cenaZaKm'] * (dystans / 1000))).toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FloatingActionButton(
                            backgroundColor: Theme.of(context).highlightColor,
                            child: Icon(Icons.local_phone),
                            onPressed: () {
                              // _wyslijSMS();
                              return showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Wybierz wiadomość"),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            FlatButton(
                                              splashColor: Theme.of(context)
                                                  .highlightColor,
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              child: Text(message[0],
                                                  textAlign: TextAlign.center),
                                              onPressed: () {
                                                _wyslijSMS(message[0]);
                                              },
                                            ),
                                            SizedBox(height: 12),
                                            FlatButton(
                                              splashColor: Theme.of(context)
                                                  .highlightColor,
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              padding: EdgeInsets.all(8),
                                              child: Text(message[1],
                                                  textAlign: TextAlign.center),
                                              onPressed: () {
                                                _wyslijSMS(message[1]);
                                              },
                                            ),
                                            SizedBox(height: 12),
                                            FlatButton(
                                              splashColor: Theme.of(context)
                                                  .highlightColor,
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              padding: EdgeInsets.all(8),
                                              child: Text(
                                                message[2],
                                                textAlign: TextAlign.center,
                                              ),
                                              onPressed: () {
                                                _wyslijSMS(message[2]);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Powrót',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  }
                                  );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
          );
        } else {
          return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Center(
                child: SpinKitCircle(
                  color: Theme.of(context).accentColor,
                  size: 150.0,
                  duration: Duration(seconds: 1),
                ),
              )
          );
        }
      },
    );
  }
}
