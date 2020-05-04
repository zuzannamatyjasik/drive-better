import 'package:drivebetter/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationResult _punktPoczatkowy;
  LocationResult _punktKoncowy;
  bool _isButtonDisabled = true;

  void goToRouteMap() {
    Navigator.pushNamed(context, '/routeMap', arguments: {
      'longitude_poczatek': _punktPoczatkowy.latLng.longitude,
      'latitude_poczatek': _punktPoczatkowy.latLng.latitude,
      'longitude_koniec': _punktKoncowy.latLng.longitude,
      'latitude_koniec': _punktKoncowy.latLng.latitude
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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
        body: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Text(
                          'Punkt początkowy: ${((_punktPoczatkowy).toString() != 'null') ? '${_punktPoczatkowy.latLng.latitude}, ${_punktPoczatkowy.latLng.longitude}' : ' '}',
                          style: TextStyle(
                            letterSpacing: 2,
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.place),
                        onPressed: () async {
                          LocationResult result = await showLocationPicker(
                            context,
                            apiKey,
                            initialCenter: LatLng(31.1975844, 29.9598339),
                            myLocationButtonEnabled: true,
                            layersButtonEnabled: false,
                          );
                          print("result = $result");
                          setState(() => _punktPoczatkowy = result);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Text(
                          'Punkt końcowy: ${((_punktKoncowy).toString() != 'null') ? '${_punktKoncowy.latLng.latitude}, ${_punktKoncowy.latLng.longitude}' : ' '}',
                          style: TextStyle(
                            letterSpacing: 2,
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.place),
                        onPressed: () async {
                          LocationResult result = await showLocationPicker(
                            context,
                            apiKey,
                            initialCenter: LatLng(31.1975844, 29.9598339),
                            myLocationButtonEnabled: true,
                            layersButtonEnabled: false,
                          );
                          print("result = $result");
                          setState(() {
                            _punktKoncowy = result;
                            if (_punktPoczatkowy.toString() != null &&
                                _punktKoncowy.toString() != null) {
                              _isButtonDisabled = false;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Opłata początkowa'),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cena za kilometr',
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  disabledColor: Colors.grey,
                  onPressed: _isButtonDisabled ? null : goToRouteMap,
                  child: Text(
                    'OBLICZ',
                    style: TextStyle(letterSpacing: 2, fontSize: 20),
                  ),
                  color: Colors.orangeAccent,
                ),
              ],
            )));
  }
}
